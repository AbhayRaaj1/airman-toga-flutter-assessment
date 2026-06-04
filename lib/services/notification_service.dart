import '../features/notifications/models/notification_item.dart';

class NotificationService {
  Future<List<NotificationItem>>
  getNotifications() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return [
      NotificationItem(
        id: "1",
        title: "Upcoming Flight",
        message:
        "Navigation Exercise tomorrow at 07:30 AM",
        type: "flight",
        time: "2h ago",
        isRead: false,
      ),

      NotificationItem(
        id: "2",
        title: "Study Reminder",
        message:
        "Complete Meteorology Chapter 5",
        type: "study",
        time: "5h ago",
        isRead: false,
      ),

      NotificationItem(
        id: "3",
        title: "Instructor Feedback",
        message:
        "Good progress in navigation exercises",
        type: "feedback",
        time: "Yesterday",
        isRead: true,
      ),
    ];
  }
}