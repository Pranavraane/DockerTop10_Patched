from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def home():
    name = request.args.get("name", "User")
    # Secure rendering to avoid SSTI, requires "index.html" in /templates directory
    return render_template("index.html", name=name)

if __name__ == "__main__":
    # Run only on documented port; remove debug mode for production
    app.run(host='0.0.0.0', port=5000)
