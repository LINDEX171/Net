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
  // Future<void> logout() async {
  //   await _firebaseAuth.signOut();
  // }

  //CREATE USER WITH EMAIL-PASSWORD
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //SIGNIN WITH GOOGLE
  Future<dynamic> signInWithGoogle() async {
    try{
      //begin interactive signin process
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
     //obtain auth detail from request
      final GoogleSignInAuthentication? googleAuth =
      //create a new credntial for user
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      //finnally lets sign in
      return await _firebaseAuth.signInWithCredential(credential);
    }on Exception catch (e){
      //TODO
      print('exception->$e');
    }
  }

  // LOGOUT WITH GOOGLE
// LOGOUT WITH GOOGLE
  Future<void> signOutWithGoogle() async {
    await GoogleSignIn().signOut(); // Déconnecte l'utilisateur de Google
    await _firebaseAuth.signOut(); // Déconnecte l'utilisateur de Firebase
  }


}
