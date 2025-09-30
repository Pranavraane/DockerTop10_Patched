from flask import Flask, request
import subprocess

app = Flask(__name__)

@app.route('/run_command', methods=['POST'])
def run_command():
    cmd = request.form.get('cmd', '')
    # Intentionally unsafe command execution!
    output = subprocess.getoutput(cmd)
    return f"<pre>{output}</pre>"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
