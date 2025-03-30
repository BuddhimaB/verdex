import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'features/splash/splash_screen.dart';

class VerdexApp extends StatelessWidget {
  const VerdexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Verdex',
      theme: verdexTheme,
      home: const SplashScreen(),
    );
  }
}
