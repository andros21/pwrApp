#!/usr/bin/env python
# -*- coding: utf-8 -*-

# ......................................................
#                            ___
#        ____ _      _______/   |  ____  ____
#       / __ \ | /| / / ___/ /| | / __ \/ __ \
#      / /_/ / |/ |/ / /  / ___ |/ /_/ / /_/ /
#     / .___/|__/|__/_/  /_/  |_/ .___/ .___/
#    /_/                       /_/   /_/
#
#    Author: Andrea Rossoni
#    Scope:  Dash application to interactively analyze
#            power consuptions recorded by
#            https://github.com/andros21/mcce.git
#            querying from local or remote database
# ......................................................

import calendar
import datetime
import os
import re
import sqlite3

import dash
from dash import dcc
from dash import html
from dash import dash_table as dtt
import numpy as np
import pandas as pd
from dash.dependencies import Input, Output
from flask import Flask

# Create dynamic application
# --------------------------------
server = Flask(__name__)
app = dash.Dash(__name__, server)
app.title = "ePwr Stats"

# Default vars
# -------------
dyear = int((datetime.datetime.now() - datetime.timedelta(days=1)).year)
dmonth = 1
dday = 1


def serve_layout():
    """
    Return application layout, so that at every
    page refresh the app will refresh the input files
    """

    # Load markdown header and footer
    # ----------------------------------------------
    with open("assets/head.md", "r") as fs:
        header = fs.read()
    with open("assets/foot.md", "r") as fs:
        footer = fs.read()
        footer = footer.replace("YEAR", str(datetime.datetime.now().year))

    # Define daily stats table, and search for
    # different year DBs
    # ----------------------------------------------
    yearDBs = [
        re.search(r"20[2-9][0-9]", os.path.basename(db)).group()
        for db in os.listdir(os.path.dirname(f"{os.environ['DATABASE_URL']}.{dyear}"))
    ]

    # Build app layout and return it
    # ----------------------------------------------
    return html.Div(
        className="main-div",
        children=[
            dcc.Markdown(header, className="header-div"),
            html.Div(
                [
                    dcc.Slider(
                        id="year-slider",
                        className="month-slider",
                        min=int(min(yearDBs)),
                        max=int(max(yearDBs)),
                        value=dyear,
                        marks={int(year): year for year in yearDBs},
                        step=None,
                    ),
                    html.Div(id="serialize-df", style={"display": "none"}),
                    dcc.Slider(
                        id="month-slider", min=1, max=12, className="month-slider"
                    ),
                    dcc.Graph(id="hist-slider", className="hist-slider"),
                    html.Div(
                        className="table-slider",
                        children=[
                            html.Div(
                                className="plot-hover",
                                children=[dcc.Graph(id="plot-hover")],
                            ),
                            html.Div(
                                className="mtable-slider",
                                children=[
                                    dtt.DataTable(
                                        id="mtable-slider",
                                        columns=[
                                            {"name": " ", "id": "1"},
                                            {"name": "Powerh [kWh]", "id": "2"},
                                        ],
                                        style_cell={"textAlign": "center"},
                                        style_header={
                                            "backgroundColor": "#F3F3F3",
                                            "fontWeight": "bold",
                                        },
                                        style_cell_conditional=[
                                            {
                                                "if": {"column_id": "1"},
                                                "fontWeight": "bold",
                                            }
                                        ],
                                    ),
                                    dcc.Markdown(
                                        id="mark-slider", className="mark-slider"
                                    ),
                                ],
                            ),
                        ],
                    ),
                    html.Div(
                        className="table-slider",
                        children=[
                            html.Div(
                                className="mmark-slider",
                                children=[
                                    dcc.Markdown(
                                        id="mark1-slider", className="mark-slider"
                                    )
                                ],
                            ),
                            html.Div(
                                className="pie-slider",
                                children=[dcc.Graph(id="pie-slider")],
                            ),
                        ],
                    ),
                ]
            ),
            dcc.Markdown(footer, className="footer-div"),
        ],
    )


# Create app layout
# -----------------------
app.layout = serve_layout

# Callbacks functions
# -------------------------------------


@app.callback(
    Output("serialize-df", "children"),
    Input("year-slider", "value"),
)
def update_serializer(year):
    db_uri = f"{os.environ['DATABASE_URL']}.{year}" if year is not None else dyear
    engine = sqlite3.connect(db_uri)
    dailyStats = pd.read_sql(
        "select * from avg", engine, index_col="index", parse_dates=["index"]
    )
    engine.close()
    return dailyStats.to_json()


@app.callback(
    [
        Output("month-slider", "min"),
        Output("month-slider", "max"),
        Output("month-slider", "value"),
        Output("month-slider", "marks"),
        Output("month-slider", "step"),
    ],
    Input("serialize-df", "children"),
)
def update_month(ser):
    """
    Update month slider as function of
    selected database year.
    In case of None use Current year as default year
    """
    dailyStats = pd.read_json(ser)
    return (
        dailyStats.index.month.min(),
        dailyStats.index.month.max(),
        dailyStats.index.month.min(),
        {
            month: datetime.date(1900, month, 1).strftime("%b")
            for month in range(
                dailyStats.index.month.min(), dailyStats.index.month.max() + 1
            )
        },
        None,
    )


@app.callback(
    Output("hist-slider", "figure"),
    [
        Input("year-slider", "value"),
        Input("month-slider", "value"),
        Input("serialize-df", "children"),
    ],
)
def update_hist(year, month, ser):
    """
    Update histogram plot as a function of
    selected year in year-slider
    selected month in month-slider.
    In case of None use Current year as default year
    In case of None use January as default month
    """
    year = year if year is not None else dyear
    month = month if month is not None else dmonth
    dailyStats = pd.read_json(ser)
    df = dailyStats.loc[f"{year}-{str(month).zfill(2)}"]
    return {
        "data": [
            dict(
                type="bar",
                x=df.index.day,
                y=df["kWh"],
                hovertext=[
                    calendar.day_name[datetime.date(year, month, day).weekday()]
                    for day in df.index.day
                ],
                marker={
                    "line": {"width": 1.7, "color": "#294763"},
                    "color": "#54bcb9",
                    "opacity": 0.6,
                },
            )
        ],
        "layout": dict(
            xaxis={"title": "Days"},
            yaxis={"title": "Powerh [kWh]"},
            margin={"t": 3},
            transition={"duration": 500},
        ),
    }


@app.callback(
    Output("mark-slider", "children"),
    [Input("year-slider", "value"), Input("month-slider", "value")],
)
def update_mark(year, month):
    """
    Update the markdown description next to
    the daily history plot, as function of
    selected year in year-slider
    selected month in month-slider.
    In case of None use Current year as default year
    In case of None use January as default month
    """
    year = year if year is not None else dyear
    month = month if month is not None else dmonth
    des1 = (
        "**Table**: stats for the "
        + f"month of {calendar.month_name[month]} "
        + f"of the year {year}"
    )
    des2 = "**Plot**: click on bars above to see " + "pwr consumption history"
    des = f"> {des1}\n\n> {des2}"
    return des


@app.callback(
    Output("mark1-slider", "children"),
    [
        Input("year-slider", "value"),
        Input("serialize-df", "children"),
    ],
)
def update_mark1(year, ser):
    """
    Update the markdown description next to
    the year pie plot.
    In case of None use January as default month
    """
    year = year if year is not None else dyear
    dailyStats = pd.read_json(ser)
    v = np.around(dailyStats.sum(), 2)[0]
    des1 = "**Pie**: Percentuage " + f"of kWh for all months avaiable inside {year}"
    des2 = f"The **total** kWh for {year} " + f"are **{v}**"
    des = f"> {des1}\n\n> {des2}"
    return des


@app.callback(
    Output("mtable-slider", "data"),
    [
        Input("year-slider", "value"),
        Input("month-slider", "value"),
        Input("serialize-df", "children"),
    ],
)
def update_mtable(year, month, ser):
    """
    Update the stats table next to the year
    pie plot, as function of
    selected year in year-slider
    selected month in month-slider.
    In case of None use Current year as default year
    In case of None use January as default month
    """
    year = year if year is not None else dyear
    month = month if month is not None else dmonth
    dailyStats = pd.read_json(ser)
    df = dailyStats.loc[f"{year}-{str(month).zfill(2)}"]["kWh"]
    label = ["max", "min", "mid", "std", "sum"]
    value = np.around([df.max(), df.min(), df.mean(), df.std(), df.sum()], 2)
    data = {"1": label, "2": value}
    adf = pd.DataFrame(data)
    return adf.to_dict("records")


@app.callback(
    Output("plot-hover", "figure"),
    [
        Input("serialize-df", "children"),
        Input("year-slider", "value"),
        Input("month-slider", "value"),
        Input("hist-slider", "clickData"),
    ],
)
def update_plot_hover(ser, year, month, hoverdict):
    """
    Update the history plot, as function of:
      * selected year in year-slider
      * selected month in month-slider
      * selected day in hist-slider
    In case of None use Current year as default year
    In case of None month use January as default
    In case of None day use 1st as default
    """
    year = year if year is not None else dyear
    month = month if month is not None else dmonth
    dailyStats = pd.read_json(ser)
    df = dailyStats.loc[f"{year}-{str(month).zfill(2)}"]
    if hoverdict is not None:
        day = hoverdict["points"][0]["x"]
        mday = df.index.day.max()
        if day > mday:
            day = str(mday).zfill(2)
        else:
            day = str(day).zfill(2)
    else:
        day = str(dday).zfill(2)

    table = f"{year}-{str(month).zfill(2)}-{day}"
    db_uri = f"{os.environ['DATABASE_URL']}.{year}" if year is not None else dyear
    engine = sqlite3.connect(db_uri)
    dailyHistory = pd.read_sql(
        f'select * from "{table}"', engine, index_col="index", parse_dates=["index"]
    )
    engine.close()

    return {
        "data": [
            dict(
                type="scatter",
                fill="tozeroy",
                x=np.arange(0, dailyHistory["Wh"].size),
                y=dailyHistory["Wh"],
                marker={
                    "color": "#ffce19",
                },
                hovertext=[str(tm)[:-3] for tm in dailyHistory.index.time],
                name=f"{day} {calendar.month_abbr[month]} {year}",
                showlegend=True,
            )
        ],
        "layout": dict(
            yaxis={"title": "Powerh [Wh]"},
            margin={"t": 15, "r": 0, "l": 65},
            legend={"x": 0.01, "y": 1},
            transition={"duration": 500},
        ),
    }


@app.callback(
    Output("pie-slider", "figure"),
    [Input("year-slider", "value"), Input("serialize-df", "children")],
)
def update_pie(year, ser):
    """
    Update the pie plot using dailyStats, as
    function of selected year in year-slider
    In case of None use Current year as default year
    """
    year = year if year is not None else dyear
    dailyStats = pd.read_json(ser)
    min_month = dailyStats.index.month.min()
    max_month = dailyStats.index.month.max()
    colmap = [
        "#ffc0cb",
        "#ffc5b3",
        "#e8aaa3",
        "#e8a3d2",
        "#f8b3ff",
        "#bf9098",
        "#e5adb7",
        "#ff69b4",
        "#b23875",
        "#ff82c1",
        "#bf00bf",
        "#7f007f",
    ]
    label = []
    value = []
    for month in np.arange(min_month, max_month + 1, 1):
        v = np.around(dailyStats.loc[f"{year}-{str(month).zfill(2)}"].sum(), 2)[0]
        l = calendar.month_name[month]
        value.append(v)
        label.append(l)
    return {
        "data": [
            dict(type="pie", values=value, labels=label, marker={"colors": colmap})
        ],
        "layout": dict(margin={"t": 15, "r": 0, "l": 0}, transition={"duration": 500}),
    }


if __name__ == "__main__":
    app.run_server(debug=False)
