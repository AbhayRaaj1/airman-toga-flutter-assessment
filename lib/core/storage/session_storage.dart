import 'package:shared_preferences/shared_preferences.dart';

class SessionStorage {

  static const _key =
      'logged_in';

  Future<void> saveSession() async {

    final prefs =
    await SharedPreferences
        .getInstance();

    await prefs.setBool(
      _key,
      true,
    );
  }

  Future<bool> hasSession() async {

    final prefs =
    await SharedPreferences
        .getInstance();

    return prefs.getBool(_key)
        ?? false;
  }

  Future<void> clear() async {

    final prefs =
    await SharedPreferences
        .getInstance();

    await prefs.remove(_key);
  }
}