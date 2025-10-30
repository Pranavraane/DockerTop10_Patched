FROM python:3.10-slim

WORKDIR /app

COPY app.py .

RUN pip install flask

RUN mkdir /var/log/myapp
# Set restrictive permissions to prevent unauthorized log file deletion
RUN chmod 750 /var/log/myapp

CMD ["python", "app.py"]
