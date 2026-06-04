import 'logbook_entry.dart';

class LogbookSummary {
  final double totalHours;
  final double dualHours;
  final double soloHours;
  final String lastFlight;

  final List<LogbookEntry>
  recentEntries;

  const LogbookSummary({
    required this.totalHours,
    required this.dualHours,
    required this.soloHours,
    required this.lastFlight,
    required this.recentEntries,
  });
}