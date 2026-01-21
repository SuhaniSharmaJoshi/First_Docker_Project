from flask import Flask, jsonify
import datetime

# Create Flask application
app = Flask(__name__)

# Home page
@app.route("/")
def home():
    return "<h1>Python app running inside Docker 🚀</h1>"

# Health check endpoint
@app.route("/health")
def health():
    return jsonify(status="ok")

# Time endpoint
@app.route("/time")
def time():
    return jsonify(
        server_time=str(datetime.datetime.utcnow())
    )

# Start the web server
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
