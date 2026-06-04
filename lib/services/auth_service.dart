import '../features/auth/models/cadet_profile.dart';

class AuthService {

  Future<CadetProfile> login() async {

    await Future.delayed(
      const Duration(seconds: 2),
    );

    return const CadetProfile(
      name: "Arjun Menon",
      role: "Cadet",
      course: "PPL",
      fto: "AIRMAN Flight Academy",
      instructor: "Capt. R. Sharma",
      base: "Chennai",
    );
  }
}