# Apko Chainguard Images!
# => https://github.com/chainguard-dev/apko
# => https://github.com/chainguard-images
#

# cgr.dev/chainguard/python:3.10 digest for deploy
# => https://github.com/chainguard-images/images/tree/main/images/python
#
ARG DIGEST=sha256:1cdc4d5d1a3c974b74f0c9b16d51a38f8a5c510b7772a4fab65d9d80ff49b7e4

# cgr.dev/chainguard/python:3.10-dev for build
# => https://github.com/chainguard-images/images/tree/main/images/python
#
FROM cgr.dev/chainguard/python:3.10-dev as venv
WORKDIR /home/nonroot
RUN ["/usr/bin/python", "-m" , "venv", ".venv"]
COPY requirements.txt requirements.txt
RUN [".venv/bin/pip", "install", "--no-cache-dir", "--disable-pip-version-check", "-r", "requirements.txt"]


# Dash app using cgr.dev/chainguard/python:3.10
#  * Copy venv from st stage
#
FROM cgr.dev/chainguard/python@${DIGEST}
WORKDIR /home/nonroot
COPY . .
COPY --from=venv /home/nonroot/.venv .venv
ENTRYPOINT [".venv/bin/gunicorn", "--bind", ":8080", "--workers", "2", "pwrApp:server"]
