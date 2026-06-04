import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/notification_service.dart';
import '../models/notification_item.dart';

final notificationServiceProvider =
Provider(
      (ref) =>
      NotificationService(),
);

class NotificationNotifier
    extends StateNotifier<
        List<NotificationItem>> {

  NotificationNotifier()
      : super([]);

  Future<void> loadNotifications(
      NotificationService service) async {

    state =
    await service.getNotifications();
  }

  void markAsRead(String id) {

    for (final item in state) {
      if (item.id == id) {
        item.isRead = true;
      }
    }

    state = [...state];
  }
}

final notificationProvider =
StateNotifierProvider<
    NotificationNotifier,
    List<NotificationItem>>(
      (ref) {
    return NotificationNotifier();
  },
);