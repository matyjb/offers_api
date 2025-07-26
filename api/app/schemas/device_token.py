from datetime import datetime
from pydantic import BaseModel
from typing import TYPE_CHECKING, Optional

if TYPE_CHECKING:
    from app.schemas.user import User


class DeviceTokenBase(BaseModel):
    token: str


class DeviceTokenCreate(DeviceTokenBase):
    pass


class DeviceToken(DeviceTokenBase):
    id: str
    expiration_date: datetime
    user: Optional["User"] = None
