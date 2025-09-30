FROM python:3.11-slim

# Add and use a non-root user
RUN useradd -ms /bin/bash appuser

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install jinja2==3.0.3

COPY . .

# Switch to non-root user
USER appuser

EXPOSE 5000

CMD ["python", "app.py"]
