FROM python:3.11-slim

# D02: Patch Management – Keep OS packages up to date
RUN apt-get update && apt-get upgrade -y && apt-get clean

# D01: Secure User Mapping – Create/Use a non-root user
RUN useradd -ms /bin/bash appuser

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Change ownership of files to the non-root user
RUN chown -R appuser:appuser /app

USER appuser

# D03: Restrict network exposure; EXPOSE is just documentation,
# so actual network segmentation/firewalling should be enforced by Docker run/network configuration.
EXPOSE 5000

CMD ["python", "app.py"]
