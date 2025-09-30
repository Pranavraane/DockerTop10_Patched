FROM python:3.11-slim-bullseye

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Create a non-root user without explicitly creating a group:
RUN useradd -m appuser

# Change ownership of /app to this user
RUN chown -R appuser /app

# Use the non-root user
USER appuser

EXPOSE 5000

CMD ["python", "app.py"]
