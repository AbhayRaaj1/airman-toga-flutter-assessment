# Architecture

## Overview

The application follows a feature-based architecture.

Each feature contains:

- Models
- Providers
- Presentation
- Data Layer

This allows independent scaling.

---

## Folder Structure

features/

auth/
dashboard/
study/
notes/
logbook/
notifications/

---

## State Management

Riverpod was selected because:

- Scalable
- Testable
- Compile-time safety
- Reduced boilerplate

---

## Layer Separation

UI Layer

Screens and Widgets

Provider Layer

State Management

Service Layer

Mock API and Business Logic

Model Layer

Typed Data Models

---

## Storage Strategy

SharedPreferences is used for:

- Session State
- Offline Notes

Future upgrade:

- Hive
- Isar

---

## Error Handling

All async operations support:

- Loading State
- Success State
- Error State

---

## Future Scalability

The architecture can easily support:

- Instructor workflows
- FTO dashboards
- Multi-role access
- Real backend integration