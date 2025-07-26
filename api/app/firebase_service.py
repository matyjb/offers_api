from fastapi import HTTPException, Header
import firebase_admin
from firebase_admin import credentials, auth

cred = credentials.Certificate("app/service-account.json")
firebase_admin.initialize_app(cred)


async def try_verify_firebase_token(authorization: str = Header(None)):
    if not authorization or not authorization.startswith("Bearer "):
        return None

    token = authorization.split("Bearer ")[1]
    try:
        decoded_token = auth.verify_id_token(token)
        return decoded_token  # Contains user info like uid, email, etc.
    except Exception as e:
        return HTTPException(status_code=401, detail="Invalid Firebase token")


async def verify_firebase_token(authorization: str = Header(None)):
    if not authorization or not authorization.startswith("Bearer "):
        raise HTTPException(
            status_code=401, detail="Invalid or missing authorization token"
        )

    token = authorization.split("Bearer ")[1]
    try:
        decoded_token = auth.verify_id_token(token)
        return decoded_token  # Contains user info like uid, email, etc.
    except Exception as e:
        raise HTTPException(status_code=401, detail="Invalid Firebase token")
