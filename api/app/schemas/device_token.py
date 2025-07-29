from datetime import datetime
from pydantic import BaseModel, ConfigDict
from typing import Optional


class DeviceTokenBase(BaseModel):
    token: str
    model_config = ConfigDict(from_attributes=True)


class DeviceTokenCreate(DeviceTokenBase):
    pass


class DeviceToken(DeviceTokenBase):
    id: str
    expiration_date: datetime
    user_id: Optional[str] = None
