<h1> pwrApp <a href="https://github.com/andros21/pwrApp/actions/workflows/ci-cd.yml">
    <img src="https://img.shields.io/github/actions/workflow/status/andros21/pwrApp/ci-cd.yml?branch=flyio&label=ci/cd&logo=github" alt="ci/cd">
    </a>
</h1>

### :blue_book: Description

[Dash app](https://plotly.com/) used as web UI for read/analyze electric power consumption stats collected thanks to [:zap: mcce :zap:](https://github.com/andros21/mcce)

### :star: Features

- Simple to use with a pretty css style
- Ready for production using nginx + gunicorn
- Refresh data at page reload, querying them from local sqlite3 database

### :rocket: Getting started

Steps to run repo/project:

1. Clone the repo
   ```
   git clone https://github.com/andros21/pwrApp.git /opt/MCCE/pwrApp
   ```
2. Create a python environment with packages needed
   ```
   python -m venv --system-site-packages .venv
   source .venv/bin/activate
   python -m pip install --upgrade requirements/requirements.txt
   ```
3. Copy systemd service template file inside `/etc/systemd/system/`
4. Change file permissions, that must be `-rw-r-----  root root`
5. Configure it, edit them as you need/want
6. Fire up `nginx`, install it with your package manager, setup as you like `nginx.conf`
7. Check and edit my base `pwrapp.conf.j2` as you need, then

   ```
   sudo cp -v nginx/pwrapp.conf.j2 /etc/nginx/sites-available/pwrapp.conf
   sudo ln -s /etc/nginx/sites-available/pwrapp.conf /etc/nginx/sites-enable/pwrapp.conf
   ```

   > [!WARNING]\
   > Check for `nginx.conf` mistakes using `nginx -c /etc/nginx/nginx.conf -t`

8. Reload systemd file
   ```
   sudo systemctl daemon-reload
   ```
9. Enable and start nginx
   ```
   sudo systemctl enable --now nginx.service
   ```
10. Enable and start `pwrApp.service` that will trigger gunicorn
    ```
    sudo systemctl enable --now pwrApp.service
    ```
11. Check with some `systemctl status` or using `journalctl` if everything went well
12. Enjoy your web UI interface :smile: pointing your browser to `http://yourdevicelocalnetipaddress`
