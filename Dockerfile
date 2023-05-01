# Apko Chainguard Images!
# => https://github.com/chainguard-dev/apko
# => https://github.com/chainguard-images
#

# cgr.dev/chainguard/python:3.10 digest for deploy
# => https://github.com/chainguard-images/images/tree/main/images/python
#
ARG DIGEST=sha256:1fb78ae45ad7bfc9417a9341a9962e1a71169e0b05de73b45948d82042d0a014

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
