import 'dart:async';

import 'package:diiket/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:diiket/data/repositories/firebase_auth_repository.dart';
import 'package:logger/logger.dart';

final authProvider = StateNotifierProvider<AuthState, User?>((ref) {
  return AuthState(ref.read(firebaseAuthRepositoryProvider));
});

class AuthState extends StateNotifier<User?> {
  FirebaseAuthRepository _firebaseAuthRepository;

  StreamSubscription<FirebaseUser?>? _authStateChangesSubscription;

  AuthState(this._firebaseAuthRepository) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = _firebaseAuthRepository.authStateChanges
        .listen(onFirebaseAuthStateChanges);
  }

  void onFirebaseAuthStateChanges(FirebaseUser? user) async {
    if (user != null) {
      Logger().d(await user.getIdToken());
      state = User(
        name: 'Tio Dev',
      );
    } else {
      state = null;
    }
  }

  Future<void> signInWithPhoneCredential(
      firebaseAuth.PhoneAuthCredential credential) async {
    await _firebaseAuthRepository.signInWithPhoneCredential(credential);
  }

  Future<void> signOut() async {
    await _firebaseAuthRepository.signOut();
  }
}
