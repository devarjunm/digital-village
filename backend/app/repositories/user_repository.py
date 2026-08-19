from sqlalchemy import select
from sqlalchemy.orm import Session

from app.models.user import User


def get_user_by_mobile(
    db: Session,
    mobile_number: str,
) -> User | None:
    statement = select(User).where(
        User.mobile_number == mobile_number
    )

    result = db.execute(statement)

    return result.scalar_one_or_none()


def create_user(
    db: Session,
    mobile_number: str,
    language: str,
) -> User:
    user = User(
        mobile_number=mobile_number,
        language=language,
    )

    db.add(user)
    db.commit()
    db.refresh(user)

    return user