from flask import Flask, request, render_template_string, render_template

app = Flask(__name__)

@app.route('/')
def home():
    name = request.args.get("name", "User")
    template = f"Hello {name}!"
    return render_template_string(template)
    #patch: remove above 2 lines and add below one line, index.html file is recommented
    #return render_template("index.html", name=name)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
