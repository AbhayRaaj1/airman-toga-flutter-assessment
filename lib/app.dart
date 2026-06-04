import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/login_screen.dart';

class AirmanApp extends StatelessWidget {
  const AirmanApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: const LoginScreen(),

      title: 'TOGA',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}