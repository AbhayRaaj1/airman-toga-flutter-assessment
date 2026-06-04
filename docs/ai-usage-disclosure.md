# AI Usage Disclosure

## 1. Did you use AI?

Yes.

AI was used as a development assistant.

---

## 2. What did AI generate?

- Initial architecture suggestions
- Documentation drafts
- Example models
- Testing guidance

---

## 3. What was manually reviewed?

All code.

Every generated section was reviewed and adjusted manually.

---

## 4. Rejected AI Suggestion

A fully widget-based architecture suggestion was rejected because a feature-based architecture is more scalable.

---

## 5. Personally Designed Components

- Dashboard Layout
- Navigation Flow
- Offline Notes Workflow

---

## 6. Least Confidence Area

Production-grade sync queue implementation.

---

## 7. Explain One Screen

Study Subjects Screen

- Fetches subjects through provider
- Displays progress
- Supports search
- Supports filtering
- Navigates to subject details

---

## 8. Explain State Flow

Study Provider

Service

↓

Provider

↓

UI

↓

Render

---

## 9. Explain fromJson/toJson

StudySubject.fromJson converts API JSON into typed Dart objects.

StudySubject.toJson converts model back into API-ready JSON.

---

## 10. What breaks first at 10,000 cadets?

Mock storage approach.

SharedPreferences would need replacement by:

- Hive
- Isar
- Backend sync architecture