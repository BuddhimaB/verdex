import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _authService = AuthService();

  bool get isLoggedIn => _auth.currentUser != null;

  Future<void> loginWithEmail(String email, String password) async {
    await _authService.signIn(email, password);
    notifyListeners();
  }

  Future<void> signUpWithEmail(String email, String password) async {
    await _authService.signUp(email, password);
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.signOut();
    notifyListeners();
  }
}
