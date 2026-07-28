from datetime import datetime

from sqlalchemy import Boolean, DateTime, String
from sqlalchemy.orm import Mapped, mapped_column

from app.core.database import Base


class User(Base):
    __tablename__ = "users"

    id: Mapped[int] = mapped_column(primary_key=True)

    mobile_number: Mapped[str] = mapped_column(
        String(15), unique=True, nullable=False
    )

    email: Mapped[str | None] = mapped_column(
        String(255), unique=True, nullable=True
    )

    is_mobile_verified: Mapped[bool] = mapped_column(
        Boolean, default=False
    )

    is_email_verified: Mapped[bool] = mapped_column(
        Boolean, default=False
    )

    status: Mapped[str] = mapped_column(
        String(20), default="ACTIVE"
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime, default=datetime.utcnow
    )

    updated_at: Mapped[datetime] = mapped_column(
        DateTime, default=datetime.utcnow
    )

    is_active: Mapped[bool] = mapped_column(
        Boolean, default=True
    )