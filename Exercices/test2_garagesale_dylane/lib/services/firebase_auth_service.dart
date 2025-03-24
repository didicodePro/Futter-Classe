import 'package:firebase_auth/firebase_auth.dart';
import '../utils/firebase_errors.dart'; 

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      final message = getAuthErrorMessage(e.code);
      throw Exception(message);
    } catch (e) {
      throw Exception('Erreur inconnue : ${e.toString()}');
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      final message = getAuthErrorMessage(e.code);
      throw Exception(message);
    } catch (e) {
      throw Exception('Erreur inconnue : ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
