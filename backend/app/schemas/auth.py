from pydantic import BaseModel, Field


class RegisterRequest(BaseModel):
    mobile_number: str = Field(
        ...,
        min_length=10,
        max_length=10,
        description="10-digit Indian mobile number",
    )

    language: str = Field(
        default="en",
        min_length=2,
        max_length=2,
        description="Preferred language code: en, mr, hi",
    )


class RegisterResponse(BaseModel):
    success: bool
    message: str
    user_id: int