from sqlalchemy import select
from sqlalchemy.orm import Session

from app.models.farmer import Farmer


def get_profile_by_user_id(
    db: Session,
    user_id: int,
):
    statement = select(Farmer).where(
        Farmer.user_id == user_id
    )

    return db.execute(statement).scalar_one_or_none()


def create_profile(
    db: Session,
    farmer: Farmer,
):
    db.add(farmer)
    db.commit()
    db.refresh(farmer)

    return farmer