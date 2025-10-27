from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return '''
    <form method="post" action="/greet">
      <input type="text" name="name" placeholder="Enter your name">
      <input type="submit" value="Greet Me">
    </form>
    '''

@app.route('/greet', methods=['POST'])
def greet():
    name = request.form.get('name')
    # Safe rendering with Jinja2 automatic escaping
    return render_template('greet.html', name=name)

if __name__ == "__main__":
    app.run(host="0.0.0.0")
