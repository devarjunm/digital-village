from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session

from app.core.database import get_db
from app.repositories.profile_repository import (
    get_profile_by_user_id,
)
from app.schemas.profile import (
    ProfileCreate,
    ProfileResponse,
)
from app.services.profile_service import (
    create_farmer_profile,
)

router = APIRouter(
    prefix="/profile",
    tags=["Farmer Profile"],
)


@router.post(
    "",
    response_model=ProfileResponse,
    status_code=status.HTTP_201_CREATED,
)
def create_profile(
    profile: ProfileCreate,
    db: Session = Depends(get_db),
):

    return create_farmer_profile(
        db,
        profile,
    )


@router.get(
    "/{user_id}",
    response_model=ProfileResponse,
)
def get_profile(
    user_id: int,
    db: Session = Depends(get_db),
):

    profile = get_profile_by_user_id(
        db,
        user_id,
    )

    if not profile:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="PROF-001: Profile not found",
        )

    return profile