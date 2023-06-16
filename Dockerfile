# Apko Chainguard Images!
# => https://github.com/chainguard-dev/apko
# => https://github.com/chainguard-images
#

# cgr.dev/chainguard/python:3.10-dev for build
# => https://github.com/chainguard-images/images/tree/main/images/python
#
FROM cgr.dev/chainguard/python:3.10-dev as venv
WORKDIR /home/nonroot
RUN ["/usr/bin/python", "-m" , "venv", ".venv"]
COPY requirements.txt requirements.txt
RUN [".venv/bin/pip", "install", "--no-cache-dir", "--disable-pip-version-check", "-r", "requirements.txt"]



# cgr.dev/chainguard/python:3.10 digest for deploy
# => https://github.com/chainguard-images/images/tree/main/images/python
#  * Copy venv from st stage
#
FROM cgr.dev/chainguard/python:3.10@sha256:bdbebe0f8e775e932518b01fcf58f0f33754245502499a72cff03e098b57324c
WORKDIR /home/nonroot
COPY . .
COPY --from=venv /home/nonroot/.venv .venv
EXPOSE 8080
ENTRYPOINT [".venv/bin/gunicorn", "--bind", ":8080", "--workers", "2", "pwrApp:server"]
