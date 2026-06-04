import '../features/dashboard/models/dashboard_data.dart';

class DashboardService {

  Future<DashboardData> getDashboard() async {

    await Future.delayed(
      const Duration(seconds: 2),
    );

    return const DashboardData(
      cadetName: "Arjun Menon",
      course: "PPL",
      trainingStage: "Navigation Phase",
      assignedFto: "AIRMAN Flight Academy",
      assignedInstructor: "Capt. R. Sharma",
      overallStudyProgress: 64,

      aircraft: "Cessna 172",
      flightDate: "18 May 2026",
      flightTime: "07:30 AM",
      lesson: "Navigation Exercise",

      totalHours: 42.5,
      soloHours: 6.2,
      lastFlight: "10 May 2026",
    );
  }
}