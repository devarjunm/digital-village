from sqlalchemy.orm import Session

from app.repositories.user_repository import (
    create_user,
    get_user_by_mobile,
)


def register_user(
    db: Session,
    mobile_number: str,
    language: str,
):
    existing_user = get_user_by_mobile(
        db=db,
        mobile_number=mobile_number,
    )

    if existing_user is not None:
        raise ValueError("Mobile number is already registered")

    user = create_user(
        db=db,
        mobile_number=mobile_number,
        language=language,
    )

    return user