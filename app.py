from flask import Flask, request, abort
import logging
import os

app = Flask(__name__)

log_file = "/var/log/myapp/access.log"
logging.basicConfig(filename=log_file, level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')

@app.route('/')
def home():
    logging.info(f"Home page accessed from {request.remote_addr}")
    return "Welcome to the secure app!"

@app.route('/danger')
def danger():
    # Remove or restrict log deletion endpoint to prevent abuse
    # For demonstration, we block all attempts
    abort(403, description="Access denied")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
