from datetime import datetime
from pydantic import BaseModel, ConfigDict


class OfferBase(BaseModel):
    title: str
    description: str
    image: str
    expiration_date: datetime
    model_config = ConfigDict(from_attributes=True)


class OfferCreate(OfferBase):
    channel_ids: list[str] = []


class Offer(OfferBase):
    id: str
    attachments_ids: list[str] = []  # One-to-many relationship with Attachment
    channels_ids: list[str] = []  # Many-to-many relationship with Channel
