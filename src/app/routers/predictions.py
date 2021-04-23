from typing import List

from fastapi import APIRouter, Request
from pydantic import BaseModel

router = APIRouter()


class SentimentExtractionPayload(BaseModel):
    instances: List[str]


@router.post("/extract-sentiment")
async def extract_sentiment(request: Request, payload: SentimentExtractionPayload):
    analyzer = request.app.state.sentiment_analyzer
    return analyzer(payload.instances)
