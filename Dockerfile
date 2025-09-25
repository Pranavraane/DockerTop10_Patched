FROM python:3.11-slim

# Patch Management: Update OS packages to fix vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get clean

# Secure User Mapping: Create and use non-root user
RUN useradd -ms /bin/bash appuser

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install jinja2==3.0.3


COPY . .

# Set ownership of app directory to non-root user
RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 5000

CMD ["python", "app.py"]

