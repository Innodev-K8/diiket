import 'dart:async';
import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/auth_response.dart';
import 'package:diiket/data/models/user.dart';
import 'package:diiket/data/network/auth_service.dart';
import 'package:diiket/data/providers/auth/token_provider.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
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
  FirebaseAuthRepository _firebaseAuthRepository;
  AuthService _authService;
  Reader _read;

  StreamSubscription<FirebaseUser?>? _authStateChangesSubscription;

  AuthState(
    this._firebaseAuthRepository,
    this._authService,
    this._read,
  ) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = _firebaseAuthRepository.authStateChanges
        .listen(onFirebaseAuthStateChanges);
  }

  void onFirebaseAuthStateChanges(FirebaseUser? user) async {
    if (user != null) {
      await _signInWithFirebaseUser(user);
    } else {
      await _signOutAll();
    }
  }

  Future<void> signInWithPhoneCredential(
      firebaseAuth.PhoneAuthCredential credential) async {
    try {
      await _firebaseAuthRepository.signInWithPhoneCredential(credential);

      _read(analyticsProvider).logLogin(loginMethod: 'phone_number');
    } on CustomException catch (error) {
      _read(authExceptionProvider).state = error;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuthRepository.signOut();

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
        await _signOutAll();
      }
    } on CustomException catch (error) {
      _read(authExceptionProvider).state = error;

      // TODO: try this for infinite loop
      // await _firebaseAuthRepository.signOut();

      await _signOutAll();
    }
  }

  Future<void> _signOutAll() async {
    try {
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
