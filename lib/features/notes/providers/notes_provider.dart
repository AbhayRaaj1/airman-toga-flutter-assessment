import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/notes_service.dart';
import '../data/notes_repository.dart';
import '../models/study_note.dart';
import '../models/sync_status.dart';

final notesRepositoryProvider =
Provider(
      (ref) =>
      NotesRepository(),
);

final notesServiceProvider =
Provider(
      (ref) => NotesService(),
);

class NotesNotifier
    extends StateNotifier<
        List<StudyNote>> {

  final NotesRepository repo;
  final NotesService service;

  NotesNotifier(
      this.repo,
      this.service)
      : super([]) {
    loadNotes();
  }

  Future<void> loadNotes() async {
    state =
    await repo.getNotes();
  }

  Future<void> addNote(
      StudyNote note) async {

    state = [...state, note];

    await repo.saveNotes(state);
  }

  Future<void> syncNote(
      StudyNote note) async {

    note.status =
        SyncStatus.syncing;

    state = [...state];

    final success =
    await service.syncNote();

    note.status = success
        ? SyncStatus.synced
        : SyncStatus.failed;

    state = [...state];

    await repo.saveNotes(state);
  }
}

final notesProvider =
StateNotifierProvider<
    NotesNotifier,
    List<StudyNote>>(
      (ref) => NotesNotifier(
    ref.read(
        notesRepositoryProvider),
    ref.read(
        notesServiceProvider),
  ),
);