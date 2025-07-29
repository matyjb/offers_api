from pydantic import BaseModel, ConfigDict


class ChannelBase(BaseModel):
    name: str
    model_config = ConfigDict(from_attributes=True)


class ChannelCreate(ChannelBase):
    pass


class Channel(ChannelBase):
    id: str
    users_ids: list[str] = []  # Many-to-many relationship with User
    offers_ids: list[str] = []  # Many-to-many relationship with Offer
