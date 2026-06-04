import '../features/logbook/models/logbook_entry.dart';
import '../features/logbook/models/logbook_summary.dart';

class LogbookService {

  Future<LogbookSummary>
  getLogbookSummary() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return LogbookSummary(
      totalHours: 42.5,
      dualHours: 36.3,
      soloHours: 6.2,
      lastFlight: "2026-05-10",

      recentEntries: [
        const LogbookEntry(
          date: "2026-05-10",
          aircraft: "C172",
          route:
          "VOMM - Training Area - VOMM",
          duration: 1.2,
          lesson: "Navigation",
        ),

        const LogbookEntry(
          date: "2026-05-08",
          aircraft: "C172",
          route:
          "VOMM - Circuit - VOMM",
          duration: 0.9,
          lesson: "Circuit Practice",
        ),
      ],
    );
  }
}