from pydantic import BaseModel


class CurrentWeatherResponse(BaseModel):
    location: str
    temperature: float
    condition: str
    humidity: float
    rain_probability: float
    wind_speed: float