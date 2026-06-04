import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/error_state.dart';
import '../../../shared/widgets/loading_state.dart';
import '../providers/subject_detail_provider.dart';

class SubjectDetailScreen extends ConsumerStatefulWidget {
  final String title;

  const SubjectDetailScreen({
    super.key,
    required this.title,
  });

  @override
  ConsumerState<SubjectDetailScreen> createState() =>
      _SubjectDetailScreenState();
}

class _SubjectDetailScreenState
    extends ConsumerState<SubjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final chapters =
    ref.watch(chaptersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: chapters.when(
        loading: () =>
        const LoadingState(),
        error: (e, s) =>
            ErrorState(
              message: e.toString(),
            ),
        data: (chapterList) {
          final completedCount =
              chapterList
                  .where(
                    (e) => e.completed,
              )
                  .length;

          final progress =
          chapterList.isEmpty
              ? 0.0
              : (completedCount /
              chapterList.length) *
              100;

          return SingleChildScrollView(
            padding:
            const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                /// Header
                Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.all(
                    20,
                  ),
                  decoration:
                  BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(
                      20,
                    ),
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
                      const Icon(
                        Icons.flight,
                        color:
                        Colors.white,
                        size: 50,
                      ),
                      const SizedBox(
                          height: 10),
                      Text(
                        widget.title,
                        style:
                        const TextStyle(
                          color:
                          Colors.white,
                          fontSize: 22,
                          fontWeight:
                          FontWeight
                              .bold,
                        ),
                      ),
                      const SizedBox(
                          height: 6),
                      const Text(
                        "AIRMAN Aviation Learning",
                        style:
                        TextStyle(
                          color:
                          Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                    height: 20),

                /// Progress Card
                Card(
                  elevation: 4,
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                      16,
                    ),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.all(
                      16,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        const Text(
                          "Subject Progress",
                          style:
                          TextStyle(
                            fontWeight:
                            FontWeight
                                .bold,
                            fontSize:
                            18,
                          ),
                        ),
                        const SizedBox(
                            height: 12),
                        LinearProgressIndicator(
                          value:
                          progress /
                              100,
                          minHeight: 10,
                          borderRadius:
                          BorderRadius
                              .circular(
                            20,
                          ),
                        ),
                        const SizedBox(
                            height: 10),
                        Text(
                          "${progress.toStringAsFixed(0)}% Completed",
                          style:
                          const TextStyle(
                            fontWeight:
                            FontWeight
                                .bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                    height: 20),

                const Text(
                  "Course Chapters",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                    height: 10),

                ...chapterList.map(
                      (chapter) {
                    return Card(
                      elevation: 2,
                      margin:
                      const EdgeInsets
                          .only(
                        bottom: 10,
                      ),
                      child:
                      CheckboxListTile(
                        secondary: Icon(
                          chapter.completed
                              ? Icons
                              .check_circle
                              : Icons
                              .radio_button_unchecked,
                          color: chapter
                              .completed
                              ? Colors.green
                              : Colors.grey,
                        ),
                        title: Text(
                          chapter.title,
                        ),
                        value:
                        chapter.completed,
                        onChanged:
                            (value) {
                          setState(() {
                            chapter.completed =
                                value ??
                                    false;
                          });
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(
                    height: 25),

                const Text(
                  "Learning Actions",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                    height: 12),

                GridView.count(
                  shrinkWrap: true,
                  physics:
                  const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing:
                  12,
                  mainAxisSpacing: 12,
                  childAspectRatio:
                  1.3,
                  children: [

                    _actionCard(
                      context,
                      Icons.quiz,
                      "Quiz",
                      "Take Quiz",
                    ),

                    _actionCard(
                      context,
                      Icons.style,
                      "Flashcards",
                      "Flashcards",
                    ),

                    _actionCard(
                      context,
                      Icons.assignment,
                      "Practice Test",
                      "Practice Test",
                    ),

                    _actionCard(
                      context,
                      Icons.smart_toy,
                      "AIRMAN AI",
                      "AIRMAN AI",
                    ),
                  ],
                ),

                const SizedBox(
                    height: 20),

                Card(
                  color:
                  Colors.blue.shade50,
                  child: Padding(
                    padding:
                    const EdgeInsets.all(
                      16,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.smart_toy,
                          size: 40,
                        ),
                        const SizedBox(
                            width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                            children: const [
                              Text(
                                "AIRMAN AI Assistant",
                                style:
                                TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                  height:
                                  4),
                              Text(
                                "AIRMAN AI will help you clarify aviation concepts here.",
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Widget _actionCard(
      BuildContext context,
      IconData icon,
      String title,
      String message,
      ) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) =>
              AlertDialog(
                title: Text(title),
                content:
                Text("$message Coming Soon"),
              ),
        );
      },
      child: Card(
        elevation: 3,
        shape:
        RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(
            16,
          ),
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
            ),
            const SizedBox(
                height: 10),
            Text(
              title,
              style:
              const TextStyle(
                fontWeight:
                FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}