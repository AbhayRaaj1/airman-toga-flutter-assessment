# API Readiness

## Backend Target

FastAPI + PostgreSQL

---

## Authentication

Planned flow:

POST /auth/login

Response:

- Access Token
- Refresh Token

Tokens stored securely.

---

## JWT Handling

Access token attached through interceptor.

Authorization:

Bearer <token>

---

## Refresh Tokens

Expired access tokens will be refreshed automatically.

---

## API Error Handling

Handled centrally:

401 Unauthorized

403 Forbidden

500 Server Error

Errors displayed through reusable UI components.

---

## Offline Notes Sync

Workflow:

Create Note

↓

Store Locally

↓

Pending Sync

↓

API Call

↓

Synced / Failed

↓

Retry

---

## Skynet Integration

Future workflow:

TOGA

↓

FastAPI

↓

Skynet

↓

Training Records

↓

Flight School Sync