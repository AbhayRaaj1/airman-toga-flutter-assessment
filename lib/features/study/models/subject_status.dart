enum SubjectStatus {
  notStarted,
  inProgress,
  completed,
}

extension SubjectStatusExtension
on SubjectStatus {

  String get label {
    switch (this) {
      case SubjectStatus.notStarted:
        return "Not Started";

      case SubjectStatus.inProgress:
        return "In Progress";

      case SubjectStatus.completed:
        return "Completed";
    }
  }
}