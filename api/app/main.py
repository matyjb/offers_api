from fastapi import Depends, FastAPI, HTTPException
from sqlalchemy.orm import Session
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
import uuid

from app.schemas.rebuild import rebuild_schemas
rebuild_schemas()

from app.schemas.extentions import DeviceTokenExtended, OfferExtended, UserExtended
from app.schemas.device_token import DeviceTokenCreate
from app.schemas.offer import OfferCreate
from app.schemas.user import UserCreate
from app.firebase_service import try_verify_firebase_token, verify_firebase_token
from app import models
from app.schemas import *
from app.database import SessionLocal, engine

models.Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="Offers API",
    description="API for managing offers and user subscriptions",
    version="1.0.0",
)

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


@app.get("/api/v1/user", response_model=UserExtended)
async def get_current_user(
    db: Session = Depends(get_db),
    fb_user=Depends(verify_firebase_token),
):
    db_user = db.query(models.User).filter(models.User.id == fb_user["uid"]).first()

    if not db_user:
        raise HTTPException(status_code=404, detail="User not found")

    return db_user


@app.get("/api/v1/users", response_model=list[UserExtended])
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


@app.post("/api/v1/user", response_model=UserExtended)
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


@app.post("/api/v1/device_token", response_model=DeviceTokenExtended, tags=["Devices"])
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
        db_device_token.user_id = fb_user["uid"]
        db.commit()
        db.refresh(db_device_token)
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


@app.get("/api/v1/offers", response_model=list[OfferExtended], tags=["Offers"])
async def get_offers(
    db: Session = Depends(get_db),
    fb_user=Depends(try_verify_firebase_token),
):
    """Get all available offers"""
    offers = db.query(models.Offer).outerjoin(models.Offer.channels).filter(
        models.Channel.id == None
    ).all()
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


@app.post("/api/v1/offer", response_model=OfferExtended, tags=["Offers"])
async def create_offer(
    offer: OfferCreate,
    db: Session = Depends(get_db),
    fb_user=Depends(verify_firebase_token),
):
    """Create a new offer (admin only)"""
    user = db.query(models.User).filter(models.User.id == fb_user["uid"]).first()
    if not user or not user.is_admin:
        raise HTTPException(status_code=403, detail="Access forbidden: Admins only")

    new_offer = models.Offer(
        id=str(uuid.uuid4()),
        title=offer.title,
        description=offer.description,
        image=offer.image,
        expiration_date=offer.expiration_date,
    )
    db.add(new_offer)
    db.commit()
    db.refresh(new_offer)

    if offer.channel_ids:
        channels = db.query(models.Channel).filter(
            models.Channel.id.in_(offer.channel_ids)
        ).all()
        new_offer.channels = channels
        db.commit()

    return new_offer


@app.delete("/api/v1/offer/{offer_id}", response_model=OfferExtended)
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
