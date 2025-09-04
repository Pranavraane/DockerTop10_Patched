FROM python:3.11-slim

# D02: Patch Management – Update OS packages
RUN apt-get update && apt-get upgrade -y && apt-get clean

# D01: Secure User Mapping – Create and switch to non-root user
RUN useradd -ms /bin/bash appuser

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Change ownership of application files to non-root user
RUN chown -R appuser:appuser /app

USER appuser

# D03: Network segmentation is managed at runtime, EXPOSE is for documentation
EXPOSE 5000

# D04: Prevent privilege escalation and limit resource usage at runtime (see notes)

CMD ["python", "app.py"]
