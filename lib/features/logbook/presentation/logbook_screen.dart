import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/error_state.dart';
import '../../../shared/widgets/loading_state.dart';
import '../providers/logbook_provider.dart';

class LogbookScreen
    extends ConsumerWidget {

  const LogbookScreen({
    super.key,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {

    final logbook =
    ref.watch(logbookProvider);

    return Scaffold(
      appBar: AppBar(
        title:
        const Text("Logbook"),
      ),

      body: logbook.when(

        loading: () =>
        const LoadingState(),

        error: (e, s) =>
            ErrorState(
              message: e.toString(),
            ),

        data: (data) {

          return Padding(
            padding:
            const EdgeInsets.all(16),

            child: Column(
              children: [

                Row(
                  children: [

                    Expanded(
                      child: Card(
                        child: Padding(
                          padding:
                          const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              const Text(
                                "Total Hours",
                              ),
                              Text(
                                "${data.totalHours}",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Card(
                        child: Padding(
                          padding:
                          const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              const Text(
                                "Solo Hours",
                              ),
                              Text(
                                "${data.soloHours}",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Card(
                  child: ListTile(
                    title:
                    const Text(
                      "Dual Hours",
                    ),
                    trailing: Text(
                      "${data.dualHours}",
                    ),
                  ),
                ),

                Card(
                  child: ListTile(
                    title:
                    const Text(
                      "Last Flight",
                    ),
                    trailing: Text(
                      data.lastFlight,
                    ),
                  ),
                ),

                const SizedBox(
                    height: 20),

                const Align(
                  alignment:
                  Alignment.centerLeft,
                  child: Text(
                    "Recent Entries",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(
                    height: 10),

                Expanded(
                  child:
                  data.recentEntries
                      .isEmpty
                      ? const Center(
                    child: Text(
                      "No Logbook Entries",
                    ),
                  )
                      : ListView.builder(
                    itemCount:
                    data.recentEntries.length,

                    itemBuilder:
                        (
                        context,
                        index,
                        ) {

                      final entry =
                      data.recentEntries[index];

                      return Card(
                        child:
                        ListTile(
                          title:
                          Text(
                            entry.lesson,
                          ),

                          subtitle:
                          Text(
                            "${entry.route}\n${entry.aircraft}",
                          ),

                          trailing:
                          Text(
                            "${entry.duration}h",
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(
                  width:
                  double.infinity,

                  child:
                  ElevatedButton(
                    onPressed:
                        () {

                      ScaffoldMessenger.of(
                          context)
                          .showSnackBar(
                        const SnackBar(
                          content:
                          Text(
                            "Add Logbook Entry Coming Soon",
                          ),
                        ),
                      );
                    },

                    child:
                    const Text(
                      "Add Logbook Entry",
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}