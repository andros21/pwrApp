# Apko Chainguard Images!
# => https://github.com/chainguard-dev/apko
# => https://github.com/chainguard-images
#

# Build a virtualenv using apko python-glibc image
# => https://github.com/chainguard-images/python
#
ARG DIGEST=sha256:ffb2d210e914d3494f3a2ca49cb7815bd28936a255674a9681b562a9462ce330
FROM cgr.dev/chainguard/python@${DIGEST}
WORKDIR /home/nonroot
RUN ["/usr/bin/python3", "-m" , "venv", ".venv"]
COPY requirements.txt requirements.txt
RUN [".venv/bin/pip", "install", "--no-cache-dir", "--disable-pip-version-check", "-r", "requirements.txt"]
COPY . .
ENTRYPOINT [".venv/bin/gunicorn", "--bind", ":8080", "--workers", "2", "pwrApp:server"]
