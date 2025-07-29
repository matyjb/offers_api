from sqlalchemy import Boolean, Column, DateTime, String, ForeignKey, Table
from sqlalchemy.orm import relationship
from app.database import Base
from datetime import datetime, timedelta

# Association table for many-to-many relationship
user_channel_association = Table(
    "user_channel_association",
    Base.metadata,
    Column("user_id", String, ForeignKey("users.id"), primary_key=True),
    Column("channel_id", String, ForeignKey("channels.id"), primary_key=True),
)

# Association table for many-to-many relationship between Offer and Channel
offer_channel_association = Table(
    "offer_channel_association",
    Base.metadata,
    Column("offer_id", String, ForeignKey("offers.id"), primary_key=True),
    Column("channel_id", String, ForeignKey("channels.id"), primary_key=True),
)

class Channel(Base):
    __tablename__ = "channels"
    id = Column(String, primary_key=True)
    name = Column(String, unique=True)
    users = relationship(
        "User", secondary=user_channel_association, back_populates="channels"
    )  # Many-to-many relationship
    offers = relationship(
        "Offer", secondary=offer_channel_association, back_populates="channels"
    )  # Many-to-many relationship with Offer

class DeviceToken(Base):
    __tablename__ = "device_tokens"
    id = Column(String, primary_key=True)
    token = Column(String, unique=True)
    expiration_date = Column(
        DateTime,
        nullable=False,
        default=lambda: datetime.now(datetime.timezone.utc) + timedelta(days=30),
    )
    user_id = Column(
        String, ForeignKey("users.id"), nullable=True
    )  # Make user_id nullable
    user = relationship(
        "User", back_populates="device_tokens"
    )  # Relationship to User model


class User(Base):
    __tablename__ = "users"
    id = Column(String, primary_key=True)
    email = Column(String, unique=True)
    is_admin = Column(Boolean, default=False)
    device_tokens_ids = Column(
        String, ForeignKey("device_tokens.id"), nullable=True
    )  # Reference to DeviceToken model
    channels_ids = Column(
        String, ForeignKey("channels.id"), nullable=True
    )  # Reference to Channel model
    device_tokens = relationship(
        "DeviceToken", back_populates="user"
    )  # Relationship to DeviceToken model
    channels = relationship(
        "Channel", secondary=user_channel_association, back_populates="users"
    )  # Many-to-many relationship


class Offer(Base):
    __tablename__ = "offers"
    id = Column(String, primary_key=True)
    title = Column(String)
    description = Column(String)
    image = Column(String)
    expiration_date = Column(DateTime)
    attachments = relationship(
        "Attachment", back_populates="offer"
    )  # Relationship to Attachment model
    channels = relationship(
        "Channel", secondary=offer_channel_association, back_populates="offers"
    )  # Many-to-many relationship with Channel


class Attachment(Base):
    __tablename__ = "attachments"
    id = Column(String, primary_key=True)
    file_name = Column(String)
    file_path = Column(String)
    offer_id = Column(String, ForeignKey("offers.id"))  # Reference to Offer model
    offer = relationship(
        "Offer", back_populates="attachments"
    )  # Relationship to Offer model
