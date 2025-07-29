
from pydantic import BaseModel
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from app.schemas.offer import Offer
    from app.schemas.user import User


class ChannelBase(BaseModel):
    name: str


class ChannelCreate(ChannelBase):
    pass


class Channel(ChannelBase):
    id: str
    users_ids: list[str] = []  # Many-to-many relationship with User
    offers_ids: list[str] = []  # Many-to-many relationship with Offer


class ChannelExtended(Channel):
    users: list["User"] = []  # Many-to-many relationship with User
    offers: list["Offer"] = []  # Many-to-many relationship with Offer
