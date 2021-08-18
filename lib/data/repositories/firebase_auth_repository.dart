import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthRepositoryProvider = Provider<FirebaseAuthRepository>((ref) {
  return FirebaseAuthRepository(ref.read(firebaseAuthProvider));
});

abstract class BaseFirebaseAuthRepository {
  Stream<firebase_auth.User?> get authStateChanges;
  Future<void> signInWithPhoneCredential(
      firebase_auth.PhoneAuthCredential credential);
  firebase_auth.User? getCurrentFirebaseUser();
  Future<void> signOut();
}

class FirebaseAuthRepository extends BaseFirebaseAuthRepository {
  final firebase_auth.FirebaseAuth _auth;

  FirebaseAuthRepository(this._auth);

  @override
  Stream<firebase_auth.User?> get authStateChanges => _auth.authStateChanges();

  @override
  firebase_auth.User? getCurrentFirebaseUser() {
    return _auth.currentUser;
  }

  @override
  Future<void> signInWithPhoneCredential(
      firebase_auth.PhoneAuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
    } on firebase_auth.FirebaseAuthException catch (error) {
      throw CustomException.fromFirebaseAuthException(error);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on firebase_auth.FirebaseAuthException catch (error) {
      throw CustomException.fromFirebaseAuthException(error);
    }
  }
}
