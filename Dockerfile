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
COPY requirements.txt requirements.txt
RUN [".venv/bin/pip", "install", "--no-cache-dir", "--disable-pip-version-check", "--require-hashes", "-r", "requirements.txt"]



# cgr.dev/chainguard/python:latest digest for deploy
# => https://github.com/chainguard-images/images/tree/main/images/python
#  * Copy venv from st stage
#
FROM cgr.dev/chainguard/python:latest@sha256:b8ae05271a3ac82634033e938cac688a92952119197056865ffb76e8edf1c008
WORKDIR /home/nonroot
COPY . .
COPY --from=venv /home/nonroot/.venv .venv
EXPOSE 8080
ENTRYPOINT [".venv/bin/gunicorn", "--bind", ":8080", "--workers", "2", "pwrApp:server"]
