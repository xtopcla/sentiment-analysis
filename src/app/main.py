from fastapi import FastAPI
from transformers import pipeline

from .routers import predictions

app = FastAPI()

app.include_router(predictions.router)


@app.on_event("startup")
def init_sentiment_analyzer():
    app.state.sentiment_analyzer = pipeline("sentiment-analysis")
