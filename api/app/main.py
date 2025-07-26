from fastapi import Depends, FastAPI, HTTPException
from sqlalchemy.orm import Session
from fastapi.middleware.cors import CORSMiddleware
import uvicorn

from app.schemas.rebuild import rebuild_schemas
rebuild_schemas()

from app.schemas.device_token import DeviceToken, DeviceTokenCreate
from app.schemas.offer import Offer, OfferCreate
from app.schemas.user import User, UserCreate
from app.firebase_service import try_verify_firebase_token, verify_firebase_token
from app import models
from app.schemas import *
from app.database import SessionLocal, engine



models.Base.metadata.create_all(bind=engine)

app = FastAPI()

isDebug = uvicorn.config.Config(app).reload

origins = (
    [
        "http://localhost",
        "http://localhost:8080",
        "http://localhost:5173",
    ]
    if isDebug
    else ["http://127.0.0.1", "http://127.0.0.1:80"]
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@app.get("/api/v1/user", response_model=User)
async def get_current_user(
    db: Session = Depends(get_db),
    fb_user=Depends(verify_firebase_token),
):
    db_user = db.query(models.User).filter(models.User.id == fb_user["uid"]).first()

    if not db_user:
        raise HTTPException(status_code=404, detail="User not found")

    return db_user


@app.get("/api/v1/users", response_model=list[User])
async def get_users(
    db: Session = Depends(get_db),
    fb_user=Depends(verify_firebase_token),
):
    user = db.query(models.User).filter(models.User.id == fb_user["uid"]).first()

    if not user or not user.is_admin:
        raise HTTPException(status_code=403, detail="Access forbidden: Admins only")

    db_users = db.query(models.User).all()

    if not db_users:
        raise HTTPException(status_code=404, detail="No users found")

    return db_users


@app.post("/api/v1/user", response_model=User)
async def create_user(
    user: UserCreate,
    db: Session = Depends(get_db),
    fb_user=Depends(verify_firebase_token),
):
    db_user = db.query(models.User).filter(models.User.email == user.email).first()

    if db_user:
        raise HTTPException(status_code=400, detail="Email already registered")

    new_user = models.User(
        id=fb_user["uid"],
        email=user.email,
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    return new_user


@app.post("/api/v1/device_token", response_model=DeviceToken)
async def register_device_token(
    device_token: DeviceTokenCreate,
    db: Session = Depends(get_db),
    fb_user=Depends(try_verify_firebase_token),
):
    db_device_token = (
        db.query(models.DeviceToken)
        .filter(models.DeviceToken.token == device_token.token)
        .first()
    )

    if db_device_token:
        # todo: extends expiration date for token if it exists
        db_device_token = fb_user["uid"]

        return db_device_token
    else:
        new_device_token = models.DeviceToken(
            id=fb_user["uid"],
            token=device_token.token,
            user_id=fb_user["uid"],
        )
        db.add(new_device_token)
        db.commit()
        db.refresh(new_device_token)

        return new_device_token


@app.get("/api/v1/offers", response_model=list[Offer])
async def get_offers(
    db: Session = Depends(get_db),
    fb_user=Depends(try_verify_firebase_token),
):
    # gets all the offers that have no specified channels
    offers = db.query(models.Offer).filter(len(models.Offer.channels) == 0).all()
    # get all the offers that have channels and the user is subscribed to
    if fb_user:
        user_channels = (
            db.query(models.Channel)
            .join(models.User.channels)
            .filter(models.User.id == fb_user["uid"])
            .all()
        )
        offers_with_channels = (
            db.query(models.Offer)
            .join(models.Offer.channels)
            .filter(models.Channel.id.in_([channel.id for channel in user_channels]))
            .all()
        )
        offers.extend(offers_with_channels)

    if not offers:
        raise HTTPException(status_code=404, detail="No offers found")
    return offers


@app.post("/api/v1/offer", response_model=Offer)
async def create_offer(
    offer: OfferCreate,
    db: Session = Depends(get_db),
    fb_user=Depends(verify_firebase_token),
):
    user = db.query(models.User).filter(models.User.id == fb_user["uid"]).first()
    if not user or not user.is_admin:
        raise HTTPException(status_code=403, detail="Access forbidden: Admins only")

    new_offer = models.Offer(
        title=offer.title,
        description=offer.description,
        image=offer.image,
        expiration_date=offer.expiration_date,
        channels=offer.channels,
    )
    db.add(new_offer)
    db.commit()
    db.refresh(new_offer)

    return new_offer


@app.delete("/api/v1/offer/{offer_id}", response_model=Offer)
async def delete_offer(
    offer_id: str,
    db: Session = Depends(get_db),
    fb_user=Depends(verify_firebase_token),
):
    user = db.query(models.User).filter(models.User.id == fb_user["uid"]).first()
    if not user or not user.is_admin:
        raise HTTPException(status_code=403, detail="Access forbidden: Admins only")

    offer = db.query(models.Offer).filter(models.Offer.id == offer_id).first()
    if not offer:
        raise HTTPException(status_code=404, detail="Offer not found")

    db.delete(offer)
    db.commit()

    return offer
