import 'package:firebasetest/services/auth/auth_user.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;
  Future<AuthUser> logIn({required String email, required String password});
  Future<AuthUser> createUser(
      {required String email, required String password});

  Future<void> logOut();
  Future<void> sendEmailVerification();
}
