import 'dart:developer';

import 'package:dreamtier/models/auth_user_model.dart';
import 'package:dreamtier/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthStatus { unknown, authenticated, unregistered, unauthenticated }

class AuthNotifier extends StateNotifier<AuthUser?> {
  AuthNotifier() : super(null);
  final _auth = FirebaseAuth.instance;
  AuthStatus status = AuthStatus.unknown;
  Future<AuthStatus> restoreAuthState() async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      status = AuthStatus.unauthenticated;
      return status;
    }
    final userInfo = await UserServices.fetchUserInfo(currentUser.uid);
    if (userInfo == null) {
      status = AuthStatus.unregistered;
      return status;
    }
    status = AuthStatus.authenticated;
    state = AuthUser.fromJson(userInfo);
    return status;
  }

  Future<void> signUpWithDetails(
      String email, String password, String phone, String name) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((creds) async {
      await UserServices.createUser(creds.user!.uid, email, phone, name)
          .then((user) {
        if (user == null) return;
        state = AuthUser.fromJson(user);
      });
    });
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((res) {
      log(res.toString());
    });
  }

  Future<void> restoreUser(String userId) async {
    await UserServices.fetchUserInfo(userId).then((user) {
      if (user == null) return;
      state = AuthUser.fromJson(user);
    });
  }

  void logout() async {
    await _auth.signOut();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthUser?>((ref) {
  return AuthNotifier();
});
