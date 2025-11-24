from fastapi import FastAPI
import requests

app = FastAPI()

@app.get("/api/status")
def status():
    return {"status": "API Gateway OK"}

@app.get("/api/data")
def get_data():
    r = requests.get("http://backend:5000/data")
    return {"gateway": "ok", "backend_data": r.json()}
