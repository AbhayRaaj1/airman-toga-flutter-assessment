# AIRMAN TOGA Flutter Assessment

## Project Overview

This project is a Flutter-based implementation of a TOGA Cadet Module for AIRMAN Aeronautics.

The application simulates pilot training workflows including:

- Cadet Login
- Dashboard
- Study Subjects
- Subject Progress
- Offline Study Notes
- Sync Simulation
- Logbook Summary
- Notifications

The architecture is designed to be ready for future FastAPI backend integration.

---

## Tech Stack

- Flutter
- Dart
- Riverpod
- SharedPreferences
- Material Design

---

## State Management

Riverpod

Used for:

- Dashboard State
- Study Subjects
- Notifications
- Notes
- Logbook

---

## Features

### Authentication

- Mock Cadet Login
- Session State

### Dashboard

- Cadet Information
- Progress Overview
- Upcoming Flight
- Logbook Summary

### Study

- Subjects List
- Progress Tracking
- Chapter Management

### Offline Notes

- Save Draft Notes
- Sync Simulation
- Retry Failed Sync

### Logbook

- Flight Hour Summary
- Recent Entries

### Notifications

- Read/Unread
- Mark Read
- Filter Unread

---

## Folder Structure

lib/
├── core/
├── services/
├── shared/
├── features/
│ ├── auth/
│ ├── dashboard/
│ ├── study/
│ ├── notes/
│ ├── logbook/
│ └── notifications/

---

## Setup

flutter pub get

---

## Run App

flutter run

---

## Run Tests

flutter test

---

## Local Storage

SharedPreferences is used for:

- Session Persistence
- Offline Notes

---

## API Readiness

Services and providers are separated from UI.

FastAPI integration can replace mock services with minimal UI changes.

---

## Known Limitations

- Mock API only
- No real authentication
- No backend sync

---

## Future Improvements

- Dio Integration
- JWT Authentication
- Hive Storage
- Push Notifications
- Offline Queue Sync

---

## AI Usage Summary

AI assistance was used for architecture guidance, documentation drafting, and code review.

All generated code was manually reviewed and modified.