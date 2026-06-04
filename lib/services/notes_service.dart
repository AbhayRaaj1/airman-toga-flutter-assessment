import 'dart:math';

class NotesService {

  Future<bool> syncNote() async {

    await Future.delayed(
      const Duration(seconds: 2),
    );

    return Random().nextBool();
  }
}