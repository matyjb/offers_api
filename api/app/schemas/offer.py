from datetime import datetime
from pydantic import BaseModel
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from app.schemas.channel import Channel
    from app.schemas.attachment import Attachment


class OfferBase(BaseModel):
    title: str
    description: str
    image: str
    expiration_date: datetime


class OfferCreate(OfferBase):
    channel_ids: list[str] = []


class Offer(OfferBase):
    id: str
    attachments_ids: list[str] = []  # One-to-many relationship with Attachment
    channels_ids: list[str] = []  # Many-to-many relationship with Channel


class OfferExtended(Offer):
    id: str
    attachments: list["Attachment"] = []  # One-to-many relationship with Attachment
    channels: list["Channel"] = []  # Many-to-many relationship with Channel
