from flask import Flask, jsonify


app = Flask(__name__)


@app.get("/")
def index():
    return jsonify(message="Hello from Jenkins Flask Application")


@app.get("/health")
def health():
    return jsonify(status="healthy")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
