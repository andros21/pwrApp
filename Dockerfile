# Apko Chainguard Images!
# => https://github.com/chainguard-dev/apko
# => https://github.com/chainguard-images
#

# Build a virtualenv using apko python-glibc image
# => https://github.com/chainguard-images/python
#
FROM cgr.dev/chainguard/python:latest-glibc AS venv
WORKDIR /home/nonroot
RUN ["/usr/bin/python3", "-m" , "venv", "--upgrade-deps", ".venv"]
COPY requirements.txt requirements.txt
RUN [".venv/bin/pip", "install", "--disable-pip-version-check", "-r", "requirements.txt"]
COPY . .
ENTRYPOINT [".venv/bin/gunicorn", "--bind", ":8080", "--workers", "2", "pwrApp:server"]