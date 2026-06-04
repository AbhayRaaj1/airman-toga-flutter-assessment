import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/app_button.dart';
import '../../dashboard/presentation/dashboard_screen.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final authState = ref.watch(
      authProvider,
    );

    ref.listen(
      authProvider,
          (previous, next) {
        if (next.user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) =>
              const DashboardScreen(),
            ),
          );
        }
      },
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A2540),
              Color(0xFF1565C0),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding:
            const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [

                /// Logo
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(
                      55,
                    ),
                  ),
                  child: const Icon(
                    Icons.flight_takeoff,
                    size: 60,
                    color: Color(
                      0xFF0A2540,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                /// App Name
                const Text(
                  "TOGA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight:
                    FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),

                const Text(
                  "AI Powered Pilot Learning Platform",
                  textAlign:
                  TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),

                /// Cadet Profile Card
                Card(
                  elevation: 8,
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.all(
                      20,
                    ),
                    child: Column(
                      children: [

                        const CircleAvatar(
                          radius: 35,
                          child: Icon(
                            Icons.person,
                            size: 35,
                          ),
                        ),

                        const SizedBox(
                          height: 12,
                        ),

                        const Text(
                          "Arjun Menon",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight:
                            FontWeight
                                .bold,
                          ),
                        ),

                        const SizedBox(
                          height: 6,
                        ),

                        const Chip(
                          label:
                          Text("Cadet"),
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        const ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.school,
                          ),
                          title:
                          Text("Course"),
                          subtitle:
                          Text("PPL"),
                        ),

                        const ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.flight,
                          ),
                          title:
                          Text("FTO"),
                          subtitle: Text(
                            "AIRMAN Flight Academy",
                          ),
                        ),

                        const ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.person,
                          ),
                          title: Text(
                            "Instructor",
                          ),
                          subtitle: Text(
                            "Capt. R. Sharma",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    icon: authState.isLoading
                        ? const SizedBox(
                      width: 20,
                      height: 20,
                      child:
                      CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                        : const Icon(
                      Icons.login,
                    ),
                    label: Text(
                      authState.isLoading
                          ? "Logging In..."
                          : "Continue as Cadet",
                    ),
                    onPressed:
                    authState.isLoading
                        ? null
                        : () {
                      ref
                          .read(
                        authProvider
                            .notifier,
                      )
                          .login();
                    },
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                const Text(
                  "TOGA • AIRMAN Aeronautics",
                  style: TextStyle(
                    color:
                    Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}