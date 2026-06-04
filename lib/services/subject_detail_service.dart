import '../features/study/models/chapter.dart';

class SubjectDetailService {

  Future<List<Chapter>>
  getChapters() async {

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    return [
      Chapter(
        title: "Atmosphere",
        completed: true,
      ),
      Chapter(
        title: "Pressure Systems",
        completed: true,
      ),
      Chapter(
        title: "Clouds and Precipitation",
        completed: false,
      ),
      Chapter(
        title: "Thunderstorms",
        completed: false,
      ),
    ];
  }
}