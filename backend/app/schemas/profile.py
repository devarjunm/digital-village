from datetime import date
from typing import Optional

from pydantic import BaseModel, Field


class CropCreate(BaseModel):
    season: Optional[str] = None
    crop_name: str = Field(min_length=2, max_length=100)
    variety: Optional[str] = None
    sowing_date: Optional[date] = None
    harvest_date: Optional[date] = None
    status: str = "current"


class FarmCreate(BaseModel):
    village_id: Optional[int] = None

    land_area: float = Field(gt=0, le=10000)
    irrigated_area: float = Field(default=0, ge=0)
    rainfed_area: float = Field(default=0, ge=0)

    soil_type: Optional[str] = None
    water_source: Optional[str] = None

    latitude: Optional[float] = Field(
        default=None,
        ge=-90,
        le=90,
    )

    longitude: Optional[float] = Field(
        default=None,
        ge=-180,
        le=180,
    )

    crops: list[CropCreate] = []


class ProfileCreate(BaseModel):
    user_id: int

    first_name: str = Field(
        min_length=3,
        max_length=60,
    )

    last_name: str = Field(
        min_length=1,
        max_length=60,
    )

    date_of_birth: Optional[date] = None

    gender: Optional[str] = None

    language: str = "mr"

    notifications_enabled: bool = True

    dark_mode: bool = False

    farm: FarmCreate


class CropResponse(BaseModel):
    id: int
    crop_name: str
    variety: Optional[str]
    season: Optional[str]
    status: str

    model_config = {
        "from_attributes": True
    }


class FarmResponse(BaseModel):
    id: int
    land_area: float
    irrigated_area: float
    rainfed_area: float
    soil_type: Optional[str]
    water_source: Optional[str]
    latitude: Optional[float]
    longitude: Optional[float]

    crops: list[CropResponse]

    model_config = {
        "from_attributes": True
    }


class ProfileResponse(BaseModel):
    id: int
    user_id: int
    first_name: str
    last_name: str
    date_of_birth: Optional[date]
    gender: Optional[str]
    language: str
    notifications_enabled: bool
    dark_mode: bool

    farms: list[FarmResponse]

    model_config = {
        "from_attributes": True
    }