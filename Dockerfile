FROM ubuntu:24.04

WORKDIR /app

# Install Python full and venv support along with pip
RUN apt-get update && apt-get install -y python3-full python3-venv python3-pip

# Create and activate a virtual environment, then install Flask inside it
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY app.py /app/app.py

RUN pip install flask

EXPOSE 5000

CMD ["python3", "app.py"]
