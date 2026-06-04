import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/notification_provider.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({
    super.key,
  });

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState
    extends ConsumerState<NotificationsScreen> {
  String filter = "All";

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(notificationProvider.notifier)
          .loadNotifications(
        ref.read(notificationServiceProvider),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifications =
    ref.watch(notificationProvider);

    final filtered =
    filter == "Unread"
        ? notifications
        .where((e) => !e.isRead)
        .toList()
        : notifications;

    final unreadCount =
        notifications.where((e) => !e.isRead).length;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          /// Header
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.indigo,
                ],
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.notifications_active,
                  color: Colors.white,
                  size: 40,
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Notifications Center",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      Text(
                        "$unreadCount Unread Notifications",
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// Filter Chips
          Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: const Text("All"),
                selected: filter == "All",
                onSelected: (_) {
                  setState(() {
                    filter = "All";
                  });
                },
              ),

              const SizedBox(width: 12),

              ChoiceChip(
                label:
                const Text("Unread"),
                selected:
                filter == "Unread",
                onSelected: (_) {
                  setState(() {
                    filter = "Unread";
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 10),

          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref
                    .read(
                  notificationProvider
                      .notifier,
                )
                    .loadNotifications(
                  ref.read(
                    notificationServiceProvider,
                  ),
                );
              },
              child: filtered.isEmpty
                  ? ListView(
                children: const [
                  SizedBox(height: 120),
                  Icon(
                    Icons.notifications_off,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "No Notifications Found",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
                  : ListView.builder(
                padding:
                const EdgeInsets.all(12),
                itemCount:
                filtered.length,
                itemBuilder:
                    (context, index) {
                  final item =
                  filtered[index];

                  return Container(
                    margin:
                    const EdgeInsets.only(
                      bottom: 12,
                    ),
                    decoration:
                    BoxDecoration(
                      borderRadius:
                      BorderRadius
                          .circular(
                        18,
                      ),
                      color: Theme.of(
                        context,
                      ).cardColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors
                              .black
                              .withOpacity(
                            0.08,
                          ),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets
                          .all(16),

                      leading: CircleAvatar(
                        backgroundColor:
                        item.isRead
                            ? Colors
                            .grey
                            .shade200
                            : Colors
                            .blue
                            .shade100,
                        child: Icon(
                          item.isRead
                              ? Icons
                              .notifications_none
                              : Icons
                              .notifications_active,
                          color:
                          item.isRead
                              ? Colors
                              .grey
                              : Colors
                              .blue,
                        ),
                      ),

                      title: Text(
                        item.title,
                        style:
                        const TextStyle(
                          fontWeight:
                          FontWeight
                              .bold,
                        ),
                      ),

                      subtitle: Padding(
                        padding:
                        const EdgeInsets
                            .only(
                          top: 8,
                        ),
                        child: Text(
                          "${item.message}\n${item.time}",
                        ),
                      ),

                      trailing:
                      item.isRead
                          ? Container(
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal:
                          10,
                          vertical:
                          6,
                        ),
                        decoration:
                        BoxDecoration(
                          color: Colors
                              .green
                              .shade100,
                          borderRadius:
                          BorderRadius.circular(
                            20,
                          ),
                        ),
                        child:
                        const Text(
                          "Read",
                        ),
                      )
                          : ElevatedButton(
                        onPressed:
                            () {
                          ref
                              .read(
                            notificationProvider
                                .notifier,
                          )
                              .markAsRead(
                            item.id,
                          );
                        },
                        child:
                        const Text(
                          "Read",
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}