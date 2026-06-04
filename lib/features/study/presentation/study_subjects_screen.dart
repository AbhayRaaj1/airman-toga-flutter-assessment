import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/error_state.dart';
import '../../../shared/widgets/loading_state.dart';
import '../../../shared/widgets/status_badge.dart';
import '../models/study_subject.dart';
import '../models/subject_status.dart';
import '../providers/study_provider.dart';
import 'subject_detail_screen.dart';

class StudySubjectsScreen extends ConsumerStatefulWidget {
  const StudySubjectsScreen({super.key});

  @override
  ConsumerState<StudySubjectsScreen> createState() =>
      _StudySubjectsScreenState();
}

class _StudySubjectsScreenState
    extends ConsumerState<StudySubjectsScreen> {
  final TextEditingController searchController =
  TextEditingController();

  String selectedFilter = 'All';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<StudySubject> _filterSubjects(
      List<StudySubject> subjects,
      ) {
    var filtered = subjects;

    if (searchController.text.isNotEmpty) {
      filtered = filtered.where((subject) {
        return subject.subject
            .toLowerCase()
            .contains(
          searchController.text.toLowerCase(),
        );
      }).toList();
    }

    if (selectedFilter != 'All') {
      filtered = filtered.where((subject) {
        return subject.status.label ==
            selectedFilter;
      }).toList();
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final subjectsAsync =
    ref.watch(studyProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Study Subjects",
        ),
      ),
      body: subjectsAsync.when(
        loading: () =>
        const LoadingState(),
        error: (error, stackTrace) =>
            ErrorState(
              message: error.toString(),
            ),
        data: (subjects) {
          final filteredSubjects =
          _filterSubjects(subjects);

          return Column(
            children: [
              /// Search
              Padding(
                padding:
                const EdgeInsets.all(16),
                child: TextField(
                  controller:
                  searchController,
                  decoration:
                  const InputDecoration(
                    hintText:
                    "Search Subject",
                    prefixIcon:
                    Icon(Icons.search),
                    border:
                    OutlineInputBorder(),
                  ),
                  onChanged: (_) {
                    setState(() {});
                  },
                ),
              ),

              /// Filter Chips
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection:
                  Axis.horizontal,
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  children: [
                    _buildFilterChip("All"),
                    _buildFilterChip(
                        "Not Started"),
                    _buildFilterChip(
                        "In Progress"),
                    _buildFilterChip(
                        "Completed"),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              if (filteredSubjects.isEmpty)
                const Expanded(
                  child: EmptyState(
                    message:
                    "No subjects found",
                  ),
                )
              else
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      ref.invalidate(
                        studyProvider,
                      );
                    },
                    child: ListView.builder(
                      padding:
                      const EdgeInsets.all(
                        16,
                      ),
                      itemCount:
                      filteredSubjects.length,
                      itemBuilder:
                          (context, index) {
                        final subject =
                        filteredSubjects[
                        index];

                        return Card(
                          margin:
                          const EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: InkWell(
                            borderRadius:
                            BorderRadius.circular(
                              12,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      SubjectDetailScreen(
                                        title:
                                        subject.subject,
                                      ),
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                              const EdgeInsets
                                  .all(16),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          subject
                                              .subject,
                                          style:
                                          const TextStyle(
                                            fontSize:
                                            18,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                          ),
                                        ),
                                      ),
                                      StatusBadge(
                                        text: subject
                                            .status
                                            .label,
                                      ),
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 12,
                                  ),

                                  LinearProgressIndicator(
                                    value:
                                    subject.progress /
                                        100,
                                  ),

                                  const SizedBox(
                                    height: 8,
                                  ),

                                  Text(
                                    "Progress: ${subject.progress}%",
                                  ),

                                  const SizedBox(
                                    height: 6,
                                  ),

                                  Text(
                                    "Lessons: ${subject.lessonsCompleted}/${subject.totalLessons}",
                                  ),

                                  const SizedBox(
                                    height: 6,
                                  ),

                                  Text(
                                    "Quiz Score: ${subject.quizScore}%",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterChip(
      String label,
      ) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: ChoiceChip(
        label: Text(label),
        selected:
        selectedFilter == label,
        onSelected: (_) {
          setState(() {
            selectedFilter = label;
          });
        },
      ),
    );
  }
}