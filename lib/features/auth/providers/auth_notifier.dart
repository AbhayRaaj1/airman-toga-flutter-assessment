import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/storage/session_storage.dart';
import '../../../services/auth_service.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService authService;

  AuthNotifier(this.authService)
      : super(const AuthState());

  Future<void> login() async {
    try {
      state = state.copyWith(
        isLoading: true,
      );

      final user =
      await authService.login();

      await SessionStorage()
          .saveSession();

      state = state.copyWith(
        isLoading: false,
        user: user,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
  Future<void> logout() async {
    await SessionStorage().clear();

    state = const AuthState();
  }
}