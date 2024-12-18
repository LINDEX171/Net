import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  //LOGIN WITH EMAIL-PASSWORD
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //LOGOUT
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  //CREATE USER WITH EMAIL-PASSWORD
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //SIGNIN WITH GOOGLE
  Future<dynamic> signInWithGoogle() async {
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _firebaseAuth.signInWithCredential(credential);
    }on Exception catch (e){
      //TODO
      print('exception->$e');
    }
  }
}
