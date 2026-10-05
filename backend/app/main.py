from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.models.user import User
from app.models.farmer import Farmer
from app.models.farm import Farm
from app.models.crop import Crop
from app.models.location import Location

from app.api.v1.auth import router as auth_router
from app.api.v1.profile import router as profile_router
from app.api.v1.weather import router as weather_router

app = FastAPI(
    title="Digital Village API"
)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=False,
    allow_methods=["*"],
    allow_headers=["*"],
)
app.include_router(
    auth_router,
    prefix="/api/v1"
)

app.include_router(
    profile_router,
    prefix="/api/v1"
)

app.include_router(
    weather_router,
    prefix="/api/v1"
)