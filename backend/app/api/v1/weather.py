from fastapi import APIRouter, Query

from app.schemas.weather import CurrentWeatherResponse
from app.services.weather_service import get_current_weather


router = APIRouter(
    prefix="/weather",
    tags=["Weather"]
)


@router.get(
    "/current",
    response_model=CurrentWeatherResponse
)
async def current_weather(
    latitude: float = Query(..., ge=-90, le=90),
    longitude: float = Query(..., ge=-180, le=180),
):
    weather = await get_current_weather(
        latitude=latitude,
        longitude=longitude,
        location="Nashik"
    )

    return weather