class Chapter {
  final String title;
  bool completed;

  Chapter({
    required this.title,
    required this.completed,
  });

  factory Chapter.fromJson(
      Map<String, dynamic> json) {
    return Chapter(
      title: json["title"],
      completed: json["completed"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "completed": completed,
    };
  }
}