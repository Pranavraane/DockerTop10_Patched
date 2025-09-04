FROM python:3.11-slim

# D02: Update OS packages to patch vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get clean

# D01: Secure User Mapping - create and use non-root user
RUN useradd -ms /bin/bash appuser

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Change ownership to non-root user
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# D03: Only expose necessary port; network segmentation enforced at run-time via Docker networking
EXPOSE 5000

# D04: Drop unnecessary Linux capabilities and prevent privilege escalation at runtime (see notes)

# D05: Do not hard-code secrets in Dockerfile; secrets should be managed via runtime environment variables or Docker secrets

CMD ["python", "app.py"]
