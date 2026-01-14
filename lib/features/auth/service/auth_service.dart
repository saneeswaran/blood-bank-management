import 'package:blood_bank/features/profile/service/profile_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/legacy.dart';

final authSignUpLoader = StateProvider.autoDispose<bool>((ref) => false);

final authSignInLoader = StateProvider.autoDispose<bool>((ref) => false);

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static Future<User?> registerWithEmail({
    required String email,
    required String password,
    required String userName,
    required bool isDonor,
    required Map<String, dynamic> locationData,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      if (user != null) {
        await ProfileService.createUser(
          email: email,
          userName: userName,
          isDonor: isDonor,
          locationData: locationData,
        );
      }

      return user;
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'Email is already registered.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format.';
          break;
        case 'weak-password':
          errorMessage = 'Password should be at least 6 characters.';
          break;
        default:
          errorMessage = 'Registration failed: ${e.message}';
      }

      throw Exception(errorMessage);
    }
  }

  static Future<User?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address.';
          break;
        default:
          errorMessage = 'Login failed: ${e.message}';
      }

      throw Exception(errorMessage);
    }
  }

  static Future<void> signOut() async => await _auth.signOut();
}
