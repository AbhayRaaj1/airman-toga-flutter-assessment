import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/study_note.dart';

class NotesRepository {

  static const _key = "study_notes";

  Future<void> saveNotes(
      List<StudyNote> notes) async {

    final prefs =
    await SharedPreferences
        .getInstance();

    final jsonList = notes
        .map((e) =>
        jsonEncode(
            e.toJson()))
        .toList();

    await prefs.setStringList(
      _key,
      jsonList,
    );
  }

  Future<List<StudyNote>>
  getNotes() async {

    final prefs =
    await SharedPreferences
        .getInstance();

    final data =
    prefs.getStringList(_key);

    if (data == null) {
      return [];
    }

    return data
        .map(
          (e) => StudyNote.fromJson(
        jsonDecode(e),
      ),
    )
        .toList();
  }
}