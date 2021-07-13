import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// biar nggak bingung sama model User
typedef FirebaseUser = User;

final firebaseAuthRepositoryProvider = Provider<FirebaseAuthRepository>((ref) {
  return FirebaseAuthRepository(ref.read(firebaseAuthProvider));
});

abstract class BaseFirebaseAuthRepository {
  Stream<FirebaseUser?> get authStateChanges;
  Future<void> signInWithPhoneCredential(PhoneAuthCredential credential);
  FirebaseUser? getCurrentFirebaseUser();
  Future<void> signOut();
}

class FirebaseAuthRepository extends BaseFirebaseAuthRepository {
  final FirebaseAuth _auth;

  FirebaseAuthRepository(this._auth);

  @override
  Stream<FirebaseUser?> get authStateChanges => _auth.authStateChanges();

  @override
  FirebaseUser? getCurrentFirebaseUser() {
    return _auth.currentUser;
  }

  @override
  Future<void> signInWithPhoneCredential(PhoneAuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (error) {
      throw CustomException(message: error.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (error) {
      throw CustomException(message: error.message);
    }
  }
}
