from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from app.models.crop import Crop
from app.models.farm import Farm
from app.models.farmer import Farmer
from app.repositories.profile_repository import (
    create_profile,
    get_profile_by_user_id,
)
from app.schemas.profile import ProfileCreate


def create_farmer_profile(
    db: Session,
    data: ProfileCreate,
):

    existing_profile = get_profile_by_user_id(
        db,
        data.user_id,
    )

    if existing_profile:
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT,
            detail="Farmer profile already exists",
        )

    farmer = Farmer(
        user_id=data.user_id,
        first_name=data.first_name,
        last_name=data.last_name,
        date_of_birth=data.date_of_birth,
        gender=data.gender,
        language=data.language,
        notifications_enabled=data.notifications_enabled,
        dark_mode=data.dark_mode,
    )

    farm = Farm(
        village_id=data.farm.village_id,
        land_area=data.farm.land_area,
        irrigated_area=data.farm.irrigated_area,
        rainfed_area=data.farm.rainfed_area,
        soil_type=data.farm.soil_type,
        water_source=data.farm.water_source,
        latitude=data.farm.latitude,
        longitude=data.farm.longitude,
    )

    farmer.farms.append(farm)

    for crop_data in data.farm.crops:

        crop = Crop(
            season=crop_data.season,
            crop_name=crop_data.crop_name,
            variety=crop_data.variety,
            sowing_date=crop_data.sowing_date,
            harvest_date=crop_data.harvest_date,
            status=crop_data.status,
        )

        farm.crops.append(crop)

    return create_profile(db, farmer)