class DashboardData {
  final String cadetName;
  final String course;
  final String trainingStage;
  final String assignedFto;
  final String assignedInstructor;
  final int overallStudyProgress;

  final String aircraft;
  final String flightDate;
  final String flightTime;
  final String lesson;

  final double totalHours;
  final double soloHours;
  final String lastFlight;

  const DashboardData({
    required this.cadetName,
    required this.course,
    required this.trainingStage,
    required this.assignedFto,
    required this.assignedInstructor,
    required this.overallStudyProgress,
    required this.aircraft,
    required this.flightDate,
    required this.flightTime,
    required this.lesson,
    required this.totalHours,
    required this.soloHours,
    required this.lastFlight,
  });
}