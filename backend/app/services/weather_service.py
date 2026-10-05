import httpx


OPEN_METEO_URL = "https://api.open-meteo.com/v1/forecast"


def get_weather_condition(weather_code: int) -> str:
    conditions = {
        0: "Clear Sky",
        1: "Mainly Clear",
        2: "Partly Cloudy",
        3: "Cloudy",
        45: "Foggy",
        48: "Foggy",
        51: "Light Drizzle",
        53: "Drizzle",
        55: "Heavy Drizzle",
        61: "Light Rain",
        63: "Rain",
        65: "Heavy Rain",
        71: "Light Snow",
        73: "Snow",
        75: "Heavy Snow",
        80: "Rain Showers",
        81: "Rain Showers",
        82: "Heavy Rain Showers",
        95: "Thunderstorm",
        96: "Thunderstorm with Hail",
        99: "Thunderstorm with Hail",
    }

    return conditions.get(weather_code, "Unknown")


async def get_current_weather(
    latitude: float,
    longitude: float,
    location: str = "Unknown"
):
    params = {
        "latitude": latitude,
        "longitude": longitude,
        "current": (
            "temperature_2m,"
            "relative_humidity_2m,"
            "wind_speed_10m,"
            "weather_code"
        ),
        "hourly": "precipitation_probability",
        "forecast_days": 1,
        "timezone": "auto",
    }

    async with httpx.AsyncClient() as client:
        response = await client.get(
            OPEN_METEO_URL,
            params=params,
            timeout=10
        )

    response.raise_for_status()

    data = response.json()

    current = data["current"]

    rain_probability = 0

    if data.get("hourly"):
        probabilities = data["hourly"].get(
            "precipitation_probability",
            []
        )

        if probabilities:
            rain_probability = probabilities[0]

    return {
        "location": location,
        "temperature": current["temperature_2m"],
        "condition": get_weather_condition(
            current["weather_code"]
        ),
        "humidity": current["relative_humidity_2m"],
        "rain_probability": rain_probability,
        "wind_speed": current["wind_speed_10m"],
    }