# Apko Chainguard Images!
# => https://github.com/chainguard-dev/apko
# => https://github.com/chainguard-images
#

# Build a virtualenv using apko python-glibc image
# => https://github.com/chainguard-images/python
#
ARG DIGEST=sha256:ff12da8be90e23ed68217309fa08c01013b763047cd4179c69583e630a335eea
FROM cgr.dev/chainguard/python@${DIGEST}
WORKDIR /home/nonroot
RUN ["/usr/bin/python3", "-m" , "venv", ".venv"]
COPY requirements.txt requirements.txt
RUN [".venv/bin/pip", "install", "--disable-pip-version-check", "-r", "requirements.txt"]
COPY . .
ENTRYPOINT [".venv/bin/gunicorn", "--bind", ":8080", "--workers", "2", "pwrApp:server"]
