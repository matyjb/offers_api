
from __future__ import annotations
from pydantic import BaseModel
from typing import TYPE_CHECKING, Optional

if TYPE_CHECKING:
    from app.schemas.offer import Offer


class AttachmentBase(BaseModel):
    file_name: str
    url: str


class AttachmentCreate(AttachmentBase):
    pass


class Attachment(AttachmentBase):
    id: str
    offer_id: Optional[str] = None  # One-to-one relationship with Offer


class AttachmentExtended(Attachment):
    offer: Optional["Offer"] = None  # One-to-one relationship with Offer
