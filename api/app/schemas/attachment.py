from __future__ import annotations
from pydantic import BaseModel, ConfigDict
from typing import Optional


class AttachmentBase(BaseModel):
    file_name: str
    url: str
    model_config = ConfigDict(from_attributes=True)


class AttachmentCreate(AttachmentBase):
    pass


class Attachment(AttachmentBase):
    id: str
    offer_id: Optional[str] = None  # One-to-one relationship with Offer
