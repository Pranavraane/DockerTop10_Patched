from flask import Flask, jsonify
import os

app = Flask(__name__)

# Read secret securely from file mounted by Docker Secret
def read_secret():
    try:
        with open("/run/secrets/secret_key", "r") as f:
            return f.read().strip()
    except FileNotFoundError:
        return "Secret not available"

@app.route('/')
def index():
    return "<h2>D06 Patched App - Secret Protected</h2>"

@app.route('/secret')
def secret():
    # No direct exposure of secret info; API restricts access
    secret_value = read_secret()
    return jsonify({"message": "Secret securely loaded from Docker Secret"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
