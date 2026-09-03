from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

from app.api.v1.auth import router as auth_router

app = FastAPI(
    title="Digital Village API",
    description="Backend API for the Digital Village platform",
    version="1.0.0",
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
    prefix="/api/v1",
)

class UserCreate(BaseModel):
    name: str
    email: str
    otp: int 

@app.post('/signup')
def signup_user(user: UserCreate):
    #extract the data
    print(user.name)
    print(user.email)
    print(user.otp)

    pass