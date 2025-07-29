def rebuild_schemas():
    from app.schemas.extentions import (
        AttachmentExtended,
        ChannelExtended,
        DeviceTokenExtended,
        OfferExtended,
        UserExtended,
    )

    ChannelExtended.model_rebuild()
    UserExtended.model_rebuild()
    OfferExtended.model_rebuild()
    AttachmentExtended.model_rebuild()
    DeviceTokenExtended.model_rebuild()
