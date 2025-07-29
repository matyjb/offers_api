from typing import Optional

from app.schemas.attachment import Attachment
from app.schemas.channel import Channel
from app.schemas.device_token import DeviceToken
from app.schemas.offer import Offer
from app.schemas.user import User


class AttachmentExtended(Attachment):
    offer: Optional["Offer"] = None  # One-to-one relationship with Offer


class ChannelExtended(Channel):
    users: list["User"] = []  # Many-to-many relationship with User
    offers: list["Offer"] = []  # Many-to-many relationship with Offer


class OfferExtended(Offer):
    id: str
    attachments: list["Attachment"] = []  # One-to-many relationship with Attachment
    channels: list["Channel"] = []  # Many-to-many relationship with Channel


class DeviceTokenExtended(DeviceToken):
    user: Optional["User"] = None


class UserExtended(User):
    channels: list["Channel"] = []
    device_tokens: list["DeviceToken"] = []
