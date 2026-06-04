import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/dashboard_service.dart';
import '../models/dashboard_data.dart';

final dashboardServiceProvider =
Provider(
      (ref) => DashboardService(),
);

final dashboardProvider =
FutureProvider<DashboardData>((ref) async {

  return ref
      .read(dashboardServiceProvider)
      .getDashboard();
});