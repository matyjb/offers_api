
from pydantic import BaseModel
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from app.schemas.channel import Channel
    from app.schemas.device_token import DeviceToken


class UserBase(BaseModel):
    email: str
    is_admin: bool = False


class UserCreate(UserBase):
    pass


class User(UserBase):
    id: str
    channels_ids: list[str] = []
    device_tokens_ids: list[str] = []


class UserExtended(User):
    channels: list["Channel"] = []
    device_tokens: list["DeviceToken"] = []
