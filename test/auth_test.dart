import 'dart:math';

import 'package:firebasetest/services/auth/auth_exceptions.dart';
import 'package:firebasetest/services/auth/auth_provider.dart';
import 'package:firebasetest/services/auth/auth_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:test/test.dart';

void main() {
  group("Mock Authentication", () {
    final provider = MockAuthProvider();
    test("should not be initialized to begin with", () {
      expect(provider.isInitialized, false);
    });
    test("Cannot log out if not initialized", () {
      expect(provider.logOut(),
          throwsA(const TypeMatcher<NotInitializedException>()));
    });
    test("should be able to initiliazed", () async {
      await provider.initialize();
      expect(provider.isInitialized, true);
    });
    test("user should be null after initi..", () {
      expect(provider.currentUser, null);
    });
    test("should be able to initialize in less than 2", () async {
      await provider.initialize();
      expect(provider.isInitialized, true);
    }, timeout: const Timeout(Duration(seconds: 2)));
    test("create use should delegate to login function ", () async {
      final bademailuser =
          provider.createUser(email: "sayyam@gmail.com", password: "112ddd233");

      expect(bademailuser,
          throwsA(const TypeMatcher<UserNotFoundAuthException>()));

      final badPassworduser =
          provider.createUser(email: "emadil@gmail.com", password: "111111");
      expect(badPassworduser,
          throwsA(const TypeMatcher<WrongPasswordAuthException>()));

      final user = await provider.createUser(email: 's', password: '1');
      expect(provider.currentUser, user);
      expect(user.isEmailVerified, false);
    });

    test("login should able to verified", () {
      provider.sendEmailVerification();
      final user = provider.currentUser;
      expect(user, isNotNull);
      expect(user!.isEmailVerified, true);
    });

    test("should be able to logout and login again", () async {
      await provider.logOut();
      await provider.logIn(email: "email", password: 'password');
      final user = provider.currentUser;
      expect(user, isNotNull);
    });
  });
}

class NotInitializedException implements Exception {}

class MockAuthProvider implements AuthProvider {
  var _isInitialized = false;
  AuthUser? _user;
  bool get isInitialized => _isInitialized;

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    if (!isInitialized) throw NotInitializedException();
    await Future.delayed(const Duration(seconds: 1));
    return logIn(email: email, password: password);
  }

  @override
  AuthUser? get currentUser => _user;

  @override
  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    _isInitialized = true;
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) {
    if (!isInitialized) throw NotInitializedException();
    if (email == "sayyam@gmail.com") throw UserNotFoundAuthException();
    if (password == "111111") {
      throw WrongPasswordAuthException();
    }
    const user = AuthUser(isEmailVerified: false);
    _user = user;
    return Future.value(user);
  }

  @override
  Future<void> logOut() async {
    if (!isInitialized) throw NotInitializedException();
    if (_user == null) throw UserNotFoundAuthException();
    await Future.delayed(const Duration(seconds: 1));
    _user = null;
  }

  @override
  Future<void> sendEmailVerification() async {
    if (!isInitialized) throw NotInitializedException();
    final user = _user;
    if (user == null) throw UserNotFoundAuthException();
    const newuser = AuthUser(isEmailVerified: true);
    _user = newuser;
  }
}
