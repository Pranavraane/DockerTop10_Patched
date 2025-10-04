from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/ssti')
def ssti():
    name = request.args.get('name', 'User')
    # Pass user input as template variable instead of injecting directly into template string
    return render_template('hello.html', name=name)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

