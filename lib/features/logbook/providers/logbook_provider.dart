import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/logbook_service.dart';
import '../models/logbook_summary.dart';

final logbookServiceProvider =
Provider(
      (ref) => LogbookService(),
);

final logbookProvider =
FutureProvider<LogbookSummary>(
      (ref) async {
    return ref
        .read(logbookServiceProvider)
        .getLogbookSummary();
  },
);