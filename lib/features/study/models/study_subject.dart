import 'subject_status.dart';

class StudySubject {
  final String id;
  final String subject;

  final int progress;
  final int lessonsCompleted;
  final int totalLessons;
  final int quizScore;

  const StudySubject({
    required this.id,
    required this.subject,
    required this.progress,
    required this.lessonsCompleted,
    required this.totalLessons,
    required this.quizScore,
  });

  SubjectStatus get status {

    if (progress < 0 || progress > 100) {
      throw Exception(
        "Progress must be between 0 and 100",
      );
    }

    if (progress == 0) {
      return SubjectStatus.notStarted;
    }

    if (progress == 100) {
      return SubjectStatus.completed;
    }

    return SubjectStatus.inProgress;
  }

  factory StudySubject.fromJson(
      Map<String, dynamic> json,
      ) {
    return StudySubject(
      id: json["id"],
      subject: json["subject"],
      progress: json["progress"],
      lessonsCompleted:
      json["lessons_completed"],
      totalLessons:
      json["total_lessons"],
      quizScore: json["quiz_score"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "subject": subject,
      "progress": progress,
      "lessons_completed":
      lessonsCompleted,
      "total_lessons":
      totalLessons,
      "quiz_score": quizScore,
    };
  }
}