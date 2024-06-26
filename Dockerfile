# Apko Chainguard Images!
# => https://github.com/chainguard-dev/apko
# => https://github.com/chainguard-images
#

# cgr.dev/chainguard/python:latest-dev for build
# => https://github.com/chainguard-images/images/tree/main/images/python
#
FROM cgr.dev/chainguard/python:latest-dev as venv
WORKDIR /home/nonroot
RUN ["/usr/bin/python", "-m" , "venv", ".venv"]
COPY requirements/requirements.txt requirements.txt
RUN [".venv/bin/pip", "install", "--no-cache-dir", "--disable-pip-version-check", "--upgrade", "-r", "requirements.txt"]



# cgr.dev/chainguard/python:latest digest for deploy
# => https://github.com/chainguard-images/images/tree/main/images/python
#  * Copy venv from st stage
#
FROM cgr.dev/chainguard/python:latest@sha256:9c774781fbaf008bbf43eeae6fd3aef61aed210b11033415a0fd635d4c684633
WORKDIR /home/nonroot
COPY . .
COPY --from=venv /home/nonroot/.venv .venv
EXPOSE 8080
ENTRYPOINT [".venv/bin/gunicorn", "--bind", ":8080", "--workers", "2", "pwrApp:server"]
