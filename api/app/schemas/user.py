from pydantic import BaseModel, ConfigDict


class UserBase(BaseModel):
    email: str
    is_admin: bool = False
    model_config = ConfigDict(from_attributes=True)


class UserCreate(UserBase):
    pass


class User(UserBase):
    id: str
    channels_ids: list[str] = []
    device_tokens_ids: list[str] = []
