import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/dashboard_card.dart';
import '../../../shared/widgets/error_state.dart';
import '../../../shared/widgets/loading_state.dart';
import '../../logbook/presentation/logbook_screen.dart';
import '../../notes/presentation/notes_screen.dart';
import '../../notifications/presentation/notifications_screen.dart';
import '../../study/presentation/study_subjects_screen.dart';
import '../providers/dashboard_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final dashboard = ref.watch(
      dashboardProvider,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "TOGA Cadet",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: dashboard.when(
        loading: () => const LoadingState(),
        error: (e, s) => ErrorState(
          message: e.toString(),
        ),
        data: (data) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                /// HEADER
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(20),
                    gradient:
                    const LinearGradient(
                      colors: [
                        Color(0xFF0A2540),
                        Color(0xFF1565C0),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        child: Icon(
                          Icons.flight_takeoff,
                          size: 35,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        data.cadetName,
                        style:
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data.course,
                        style:
                        const TextStyle(
                          color:
                          Colors.white70,
                        ),
                      ),
                      Text(
                        data.trainingStage,
                        style:
                        const TextStyle(
                          color:
                          Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// QUICK ACTIONS
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics:
                  const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    _dashboardAction(
                      context,
                      Icons.menu_book,
                      "Study",
                      const StudySubjectsScreen(),
                    ),
                    _dashboardAction(
                      context,
                      Icons.note,
                      "Notes",
                      const NotesScreen(),
                    ),
                    _dashboardAction(
                      context,
                      Icons.flight,
                      "Logbook",
                      const LogbookScreen(),
                    ),
                    _dashboardAction(
                      context,
                      Icons.notifications,
                      "Updates",
                      const NotificationsScreen(),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// PROGRESS
                DashboardCard(
                  child: Column(
                    children: [
                      const Text(
                        "Overall Study Progress",
                        style: TextStyle(
                          fontWeight:
                          FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      LinearProgressIndicator(
                        value:
                        data.overallStudyProgress /
                            100,
                        minHeight: 10,
                        borderRadius:
                        BorderRadius
                            .circular(20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${data.overallStudyProgress}% Completed",
                        style:
                        const TextStyle(
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// FTO
                DashboardCard(
                  child: ListTile(
                    leading:
                    const Icon(Icons.school),
                    title:
                    const Text("Assigned FTO"),
                    subtitle: Text(
                      data.assignedFto,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// INSTRUCTOR
                DashboardCard(
                  child: ListTile(
                    leading:
                    const Icon(Icons.person),
                    title:
                    const Text("Instructor"),
                    subtitle: Text(
                      data.assignedInstructor,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// FLIGHT
                DashboardCard(
                  child: ListTile(
                    leading: const Icon(
                      Icons.flight_takeoff,
                      size: 40,
                    ),
                    title: Text(
                      data.aircraft,
                    ),
                    subtitle: Text(
                      "${data.flightDate} • ${data.flightTime}",
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// LOGBOOK
                DashboardCard(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Logbook Summary",
                        style: TextStyle(
                          fontWeight:
                          FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Total Hours: ${data.totalHours}",
                      ),
                      Text(
                        "Solo Hours: ${data.soloHours}",
                      ),
                      Text(
                        "Last Flight: ${data.lastFlight}",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// NOTIFICATIONS
                DashboardCard(
                  child: ListTile(
                    leading: const Icon(
                      Icons.notifications,
                    ),
                    title:
                    const Text("Notifications"),
                    subtitle:
                    const Text("3 unread updates"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const NotificationsScreen(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.menu_book,
                    ),
                    label: const Text(
                      "Continue Study",
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const StudySubjectsScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _dashboardAction(
      BuildContext context,
      IconData icon,
      String title,
      Widget screen,
      ) {
    return InkWell(
      borderRadius:
      BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => screen,
          ),
        );
      },
      child: Card(
        elevation: 3,
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 34,
            ),
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}