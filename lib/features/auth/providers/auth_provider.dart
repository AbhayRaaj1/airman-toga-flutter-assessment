import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/auth_service.dart';
import 'auth_notifier.dart';
import 'auth_state.dart';

final authServiceProvider =
Provider<AuthService>(
      (ref) => AuthService(),
);

final authProvider =
StateNotifierProvider<
    AuthNotifier,
    AuthState>((ref) {
  return AuthNotifier(
    ref.read(authServiceProvider),
  );
});