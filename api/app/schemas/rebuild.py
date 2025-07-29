from app.schemas.attachment import AttachmentExtended
from app.schemas.channel import ChannelExtended
from app.schemas.device_token import DeviceTokenExtended
from app.schemas.offer import OfferExtended
from app.schemas.user import UserExtended


def rebuild_schemas():
    ChannelExtended.model_rebuild()
    UserExtended.model_rebuild()
    OfferExtended.model_rebuild()
    AttachmentExtended.model_rebuild()
    DeviceTokenExtended.model_rebuild()
