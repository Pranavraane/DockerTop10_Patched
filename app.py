from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    # Do NOT expose environment variables publicly
    return "Welcome to the secure app. Environment details hidden."

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
