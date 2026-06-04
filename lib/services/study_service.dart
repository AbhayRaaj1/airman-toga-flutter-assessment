import '../features/study/models/study_subject.dart';

class StudyService {

  Future<List<StudySubject>>
  getSubjects() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return const [

      StudySubject(
        id: "1",
        subject: "Meteorology",
        progress: 72,
        lessonsCompleted: 18,
        totalLessons: 25,
        quizScore: 81,
      ),

      StudySubject(
        id: "2",
        subject: "Air Regulations",
        progress: 100,
        lessonsCompleted: 30,
        totalLessons: 30,
        quizScore: 92,
      ),

      StudySubject(
        id: "3",
        subject: "Navigation",
        progress: 0,
        lessonsCompleted: 0,
        totalLessons: 22,
        quizScore: 0,
      ),

      StudySubject(
        id: "4",
        subject: "Technical General",
        progress: 55,
        lessonsCompleted: 11,
        totalLessons: 20,
        quizScore: 70,
      ),
    ];
  }
}