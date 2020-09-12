# ePwr Stats App

## :blue_book: Description

[Dash app](https://plotly.com/) used as web UI for read/analyze electric power consumption stats collected thanks to [:zap: mcce :zap:](https://github.com/andros21/mcce)

## :star: Features

* Simple to use with a pretty css style
* Ready for production using nginx + uWGSI
* Refresh data at page reload, querying them from local sqlite3 database

#### :rotating_light:  Web UI preview on [Heroku](https://heroku.com/) :point_right: [ePwr Stats](https://epwr-stats.herokuapp.com/)  :rotating_light:

## :rocket: Getting started

Steps to run repo/project for a user named `mcce`:

1. Create and own a folder in `opt/`
   ```
   sudo mkdir /opt/MCCE
   sudo chown mcce:mcce /opt/MCCE
   mkdir /opt/MCCE/pwrApp
   ```
2. Clone the repo
   ```
   git clone https://github.com/andros21/pwrApp.git /opt/MCCE/pwrApp
   ```
3. Create a python environment with package needed
   ```
   cd /opt/MCCE/pwrApp
   source bin/activate
   (pwrApp) pip install -r requirements.txt
   deactivate
   ```
4. Copy systemd service template files in the correct folder
   ```
   sudo cp -v systemd/pwrApp.service_example /etc/systemd/system/pwrApp.service
   ```
5. Change file permissions, that must be `-rw-r-----  root root`, so
   ```
   sudo chown root:root pwrApp.service
   sudo chmod 0640 pwrApp.service
   ```
6. Set the `$DATABSE_URL` var to point to the correct sqlite3 database location where data are saved using [mcce](https://github.com/andros21/mcce), e.g.
   ```
   ...
   Environment="DATABASE_URL=/opt/MCCE/pwrApp/pwrApp.sqlite3"
   ...
   ```
7. Fire up `nginx`, install it with your favorite package manager, setup as you like `nginx.conf`
8. Check and edit my base `pwrapp.nginx_example` as you need, then
   ```
   sudo cp -v nginx/pwrapp.conf_example /etc/nginx/sites-available/pwrapp
   sudo ln -s /etc/nginx/sites-available/pwrapp /etc/nginx/sites-enable/pwrapp
   ```
   
   > **W:** check for `nginx.conf` mistakes using `nginx -c /etc/nginx/nginx.conf -t`
9. Reload systemd file
   ```
   sudo systemctl daemon-reload
   ```
10. Enable and start nginx
    ```
    sudo systemctl enable nginx.service
    sudo systemctl start nginx.service
    ```
11. Enable and start `pwrApp.serive` that will trigger uWGSI
    ```
    sudo systemctl enable pwrApp.service
    sudo systemctl start pwrApp.service
    ```
12. Check with some `systemctl status` or using `journalctl` if everything went well
13. Enjoy your web UI interface :smile: pointing your browser to `http://yourdevicelocalnetipaddress`
