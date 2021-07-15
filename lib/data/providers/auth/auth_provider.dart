import 'dart:async';
import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/auth_response.dart';
import 'package:diiket/data/models/user.dart';
import 'package:diiket/data/network/auth_service.dart';
import 'package:diiket/data/providers/auth/token_provider.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:diiket/data/repositories/firebase_auth_repository.dart';

final authProvider = StateNotifierProvider<AuthState, User?>((ref) {
  return AuthState(
    ref.read(firebaseAuthRepositoryProvider),
    ref.read(authServiceProvider),
    ref.read,
  );
});

final authExceptionProvider = StateProvider<CustomException?>((_) => null);

class AuthState extends StateNotifier<User?> {
  final FirebaseAuthRepository _firebaseAuthRepository;
  final AuthService _authService;
  final Reader _read;

  AuthState(
    this._firebaseAuthRepository,
    this._authService,
    this._read,
  ) : super(null) {
    _signInWithCurrentFirebaseUser();
  }

  Future<void> signInWithPhoneCredential(
      firebase_auth.PhoneAuthCredential credential) async {
    try {
      if (_firebaseAuthRepository.getCurrentFirebaseUser() != null) {
        await signOut();
      }

      await _firebaseAuthRepository.signInWithPhoneCredential(credential);
      await _signInWithCurrentFirebaseUser();

      _read(analyticsProvider).logLogin(loginMethod: 'phone_number');
    } on CustomException catch (error) {
      _read(authExceptionProvider).state = error;
    }
  }

  // Always call this after signIn using firebase auth
  Future<void> _signInWithCurrentFirebaseUser() async {
    final loggedUser = _firebaseAuthRepository.getCurrentFirebaseUser();

    if (loggedUser != null) {
      return _signInWithFirebaseUser(loggedUser);
    }
  }

  Future<void> updateUserName(String name) async {
    try {
      await _authService.updateProfile({
        'name': name,
      });

      await refreshProfile();
    } on CustomException catch (error) {
      _read(authExceptionProvider).state = error;
    }
  }

  // Komunikasi ke laravel
  Future<void> refreshProfile() async {
    try {
      state = await _authService.me();
    } on CustomException catch (error) {
      _read(authExceptionProvider).state = error;
    }
  }

  Future<void> _signInWithFirebaseUser(FirebaseUser user) async {
    try {
      final String firebaseToken = await user.getIdToken();

      final AuthResponse response =
          await _authService.loginWithFirebaseToken(firebaseToken);

      if (response.token != null && response.user != null) {
        await _read(tokenProvider.notifier).setToken(response.token!);

        // set analytics identifier
        _read(crashlyticsProvider)
            .setUserIdentifier(response.user!.firebase_uid ?? user.uid);
        _read(analyticsProvider)
            .setUserId(response.user!.firebase_uid ?? user.uid);

        state = response.user;
      } else {
        await signOut();
      }
    } on CustomException catch (error) {
      _read(authExceptionProvider).state = error;

      await signOut();
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuthRepository.signOut();

      if (_read(tokenProvider) != null) {
        await _authService.logout().onError((error, stackTrace) => null);
        await _read(tokenProvider.notifier).clearToken();
      }

      state = null;
    } on CustomException catch (error) {
      _read(authExceptionProvider).state = error;
    }
  }
}
