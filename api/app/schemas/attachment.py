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
    offer: Optional["Offer"] = None
