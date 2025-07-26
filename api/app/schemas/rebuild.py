from app.schemas.attachment import Attachment, AttachmentBase, AttachmentCreate
from app.schemas.channel import Channel, ChannelBase, ChannelCreate
from app.schemas.device_token import DeviceToken, DeviceTokenBase, DeviceTokenCreate
from app.schemas.offer import Offer, OfferBase, OfferCreate
from app.schemas.user import User, UserBase, UserCreate, UserFull


def rebuild_schemas():
    ChannelBase.model_rebuild()
    ChannelCreate.model_rebuild()
    Channel.model_rebuild()
    UserBase.model_rebuild()
    UserCreate.model_rebuild()
    User.model_rebuild()
    OfferBase.model_rebuild()
    OfferCreate.model_rebuild()
    Offer.model_rebuild()
    AttachmentBase.model_rebuild()
    AttachmentCreate.model_rebuild()
    Attachment.model_rebuild()
    UserFull.model_rebuild()
    DeviceTokenBase.model_rebuild()
    DeviceTokenCreate.model_rebuild()
    DeviceToken.model_rebuild()
