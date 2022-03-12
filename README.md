# ePwr Stats App

## :blue_book: Description

[Dash app](https://plotly.com/) used as web UI for read/analyze electric power consumption stats collected thanks to [:zap: mcce :zap:](https://github.com/andros21/mcce)

## :star: Features

* Simple to use with a pretty css style
* Ready for production using nginx + gunicorn
* Refresh data at page reload, querying them from local sqlite3 database

#### :rotating_light:  Web UI preview on [Heroku](https://heroku.com/) :point_right: [ePwr Stats](https://epwr-stats.herokuapp.com/)  :rotating_light:

## :rocket: Getting started

Steps to run repo/project:

1. Clone the repo
   ```
   git clone https://github.com/andros21/pwrApp.git /opt/MCCE/pwrApp
   ```
2. Create a python environment with packages needed
   ```
   (pwrApp) pip install -r requirements.txt
   ```
3. Copy systemd service template file inside `/etc/systemd/system/`
5. Change file permissions, that must be `-rw-r-----  root root`
6. Configure it, edit them as you need/want
7. Fire up `nginx`, install it with your package manager, setup as you like `nginx.conf`
8. Check and edit my base `pwrapp.nginx_example` as you need, then
   ```
   sudo cp -v nginx/pwrapp.conf_example /etc/nginx/sites-available/pwrapp.conf
   sudo ln -s /etc/nginx/sites-available/pwrapp.conf /etc/nginx/sites-enable/pwrapp.conf
   ```

   > **W:** check for `nginx.conf` mistakes using `nginx -c /etc/nginx/nginx.conf -t`
9. Reload systemd file
   ```
   sudo systemctl daemon-reload
   ```
10. Enable and start nginx
    ```
    sudo systemctl enable --now nginx.service
    ```
11. Enable and start `pwrApp.service` that will trigger gunicorn
    ```
    sudo systemctl enable --now pwrApp.service
    ```
12. Check with some `systemctl status` or using `journalctl` if everything went well
13. Enjoy your web UI interface :smile: pointing your browser to `http://yourdevicelocalnetipaddress`
