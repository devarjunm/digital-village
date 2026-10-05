from datetime import datetime, timezone

from sqlalchemy import DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.core.database import Base


class Farm(Base):
    __tablename__ = "farms"

    id: Mapped[int] = mapped_column(
        Integer,
        primary_key=True,
        index=True,
    )

    farmer_id: Mapped[int] = mapped_column(
        ForeignKey("farmers.id"),
        nullable=False,
        index=True,
    )

    village_id: Mapped[int | None] = mapped_column(
        ForeignKey("locations.id"),
        nullable=True,
    )

    land_area: Mapped[float] = mapped_column(
        Float,
        nullable=False,
    )

    irrigated_area: Mapped[float] = mapped_column(
        Float,
        default=0,
        nullable=False,
    )

    rainfed_area: Mapped[float] = mapped_column(
        Float,
        default=0,
        nullable=False,
    )

    soil_type: Mapped[str | None] = mapped_column(
        String(50),
        nullable=True,
    )

    water_source: Mapped[str | None] = mapped_column(
        String(50),
        nullable=True,
    )

    latitude: Mapped[float | None] = mapped_column(
        Float,
        nullable=True,
    )

    longitude: Mapped[float | None] = mapped_column(
        Float,
        nullable=True,
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        default=lambda: datetime.now(timezone.utc),
        nullable=False,
    )

    farmer = relationship(
        "Farmer",
        back_populates="farms",
    )

    crops = relationship(
        "Crop",
        back_populates="farm",
        cascade="all, delete-orphan",
    )

    location = relationship(
        "Location",
        back_populates="farms",
    )