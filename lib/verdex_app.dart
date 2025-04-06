import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:verdex/layout/app_shell.dart';

import 'core/theme.dart';
// import 'features/home/home_screen.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/search/search_screen.dart';

class VerdexApp extends StatelessWidget {
  const VerdexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Verdex',
      theme: verdexTheme,
      // ✅ Register routes here
      routes: {
        '/search': (context) => const SearchScreen(),
        // Add more routes here later if needed
      },
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasData) {
            // return const HomeScreen();
            return const AppShell();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
