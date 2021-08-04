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

import dash
import numpy as np
import pandas as pd
import sqlalchemy
from dash import dash_table as dtt
from dash import dcc, html
from dash.dependencies import Input, Output
from flask import Flask

# Create dynamic application
# --------------------------------
server = Flask(__name__)
app = dash.Dash(__name__, server)
app.title = "ePwr Stats"

# Default vars
# -------------
db_uri = os.environ["DATABASE_URL"].replace("postgres", "postgresql")
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

    # Load daily stats table from local database
    # ----------------------------------------------
    engine = sqlalchemy.create_engine(db_uri)
    dailyStats = pd.read_sql(
        "select * from avg", engine, index_col="index", parse_dates=["index"]
    )
    engine.dispose()

    # Build app layout and return it
    # ----------------------------------------------
    return html.Div(
        className="main-div",
        children=[
            dcc.Markdown(header, className="header-div"),
            html.Div(
                [
                    html.Div(
                        id="serialize-df",
                        style={"display": "none"},
                        children=dailyStats.to_json(),
                    ),
                    dcc.Slider(
                        id="month-slider",
                        className="month-slider",
                        min=dailyStats.index.month.min(),
                        max=dailyStats.index.month.max(),
                        value=dailyStats.index.month.min(),
                        marks={
                            month: datetime.date(1900, month, 1).strftime("%b")
                            for month in range(
                                dailyStats.index.month.min(),
                                dailyStats.index.month.max() + 1,
                            )
                        },
                        step=None,
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
    Output("hist-slider", "figure"),
    [Input("serialize-df", "children"), Input("month-slider", "value")],
)
def update_hist(ser, month):
    """
    Update histogram plot as a function of
    selected month in month-slider.
    In case of None use January as default month
    """
    year = dyear
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


@app.callback(Output("mark-slider", "children"), [Input("month-slider", "value")])
def update_mark(month):
    """
    Update the markdown description next to
    the daily history plot, as function of
    selected month in month-slider.
    In case of None use January as default month
    """
    year = dyear
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
    [Input("serialize-df", "children")],
)
def update_mark1(ser):
    """
    Update the markdown description next to
    the year pie plot.
    In case of None use January as default month
    """
    year = dyear
    dailyStats = pd.read_json(ser)
    v = np.around(dailyStats.sum(), 2)[0]
    des1 = "**Pie**: Percentuage " + f"of kWh for all months avaiable inside {year}"
    des2 = f"The **total** kWh for {year} " + f"are **{v}**"
    des = f"> {des1}\n\n> {des2}"
    return des


@app.callback(
    Output("mtable-slider", "data"),
    [Input("serialize-df", "children"), Input("month-slider", "value")],
)
def update_mtable(ser, month):
    """
    Update the stats table next to the year
    pie plot, as function of selected month in
    month-slider.
    In case of None use January as default month
    """
    year = dyear
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
        Input("month-slider", "value"),
        Input("hist-slider", "clickData"),
    ],
)
def update_plot_hover(ser, month, hoverdict):
    """
    Update the history plot, as function of:
      * selected month in month-slider
      * selected day in hist-slider
    In case of None month use January as default
    In case of None day use 1st as default
    """
    year = dyear
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
    engine = sqlalchemy.create_engine(db_uri)
    dailyHistory = pd.read_sql(
        f'select * from "{table}"', engine, index_col="index", parse_dates=["index"]
    )
    engine.dispose()

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


@app.callback(Output("pie-slider", "figure"), [Input("serialize-df", "children")])
def update_pie(ser):
    """Update the pie plot using dailyStats"""
    year = dyear
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
