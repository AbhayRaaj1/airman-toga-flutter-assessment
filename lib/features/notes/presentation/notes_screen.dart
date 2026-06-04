import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/study_note.dart';
import '../models/sync_status.dart';
import '../providers/notes_provider.dart';

class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({super.key});

  @override
  ConsumerState<NotesScreen> createState() =>
      _NotesScreenState();
}

class _NotesScreenState
    extends ConsumerState<NotesScreen> {
  final TextEditingController noteController =
  TextEditingController();

  String selectedSubject = "Meteorology";

  final List<String> subjects = [
    "Meteorology",
    "Air Regulations",
    "Navigation",
    "Technical General",
    "Technical Specific",
    "Air Navigation",
    "RTR / Communication",
  ];

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notes = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Offline Study Notes",
        ),
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Subject Dropdown
            DropdownButtonFormField<String>(
              value: selectedSubject,
              decoration:
              const InputDecoration(
                labelText: "Subject",
                border:
                OutlineInputBorder(),
              ),
              items: subjects.map((subject) {
                return DropdownMenuItem(
                  value: subject,
                  child: Text(subject),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedSubject =
                        value;
                  });
                }
              },
            ),

            const SizedBox(height: 16),

            /// Note Field
            TextField(
              controller: noteController,
              maxLines: 5,
              decoration:
              const InputDecoration(
                hintText:
                "Write your study notes...",
                border:
                OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (noteController.text
                      .trim()
                      .isEmpty) {
                    ScaffoldMessenger.of(
                        context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please enter a note",
                        ),
                      ),
                    );
                    return;
                  }

                  final note = StudyNote(
                    id: DateTime.now()
                        .millisecondsSinceEpoch
                        .toString(),
                    subject:
                    selectedSubject,
                    content:
                    noteController.text,
                    status:
                    SyncStatus.pending,
                  );

                  await ref
                      .read(
                    notesProvider
                        .notifier,
                  )
                      .addNote(note);

                  noteController.clear();

                  if (mounted) {
                    ScaffoldMessenger.of(
                        context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Note saved successfully",
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Save Draft",
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Divider(),

            const SizedBox(height: 10),

            const Align(
              alignment:
              Alignment.centerLeft,
              child: Text(
                "Saved Notes",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// Notes List
            Expanded(
              child: notes.isEmpty
                  ? const Center(
                child: Text(
                  "No notes available",
                ),
              )
                  : ListView.builder(
                itemCount:
                notes.length,
                itemBuilder:
                    (context,
                    index) {
                  final note =
                  notes[index];

                  return Card(
                    margin:
                    const EdgeInsets
                        .only(
                      bottom: 12,
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets
                          .all(
                        12,
                      ),
                      child:
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                        children: [
                          Text(
                            note
                                .subject,
                            style:
                            const TextStyle(
                              fontSize:
                              16,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          const SizedBox(
                              height:
                              8),

                          Text(
                            note
                                .content,
                          ),

                          const SizedBox(
                              height:
                              12),

                          Row(
                            children: [
                              Expanded(
                                child:
                                Text(
                                  note
                                      .status
                                      .label,
                                  style:
                                  TextStyle(
                                    fontWeight:
                                    FontWeight.w600,
                                  ),
                                ),
                              ),

                              if (note.status ==
                                  SyncStatus.pending ||
                                  note.status ==
                                      SyncStatus.failed)
                                ElevatedButton(
                                  onPressed:
                                      () async {
                                    await ref
                                        .read(notesProvider.notifier)
                                        .syncNote(note);

                                    if (mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            note.status ==
                                                SyncStatus.synced
                                                ? "Sync Successful"
                                                : "Sync Failed",
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    note.status ==
                                        SyncStatus.failed
                                        ? "Retry"
                                        : "Sync Now",
                                  ),
                                ),

                              if (note.status ==
                                  SyncStatus.syncing)
                                const SizedBox(
                                  width:
                                  24,
                                  height:
                                  24,
                                  child:
                                  CircularProgressIndicator(),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}