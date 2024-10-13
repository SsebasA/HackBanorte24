import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  Future<User?> registerUser({
    required String email, 
    required String password, 
    required String firstName, 
    required String secondName}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );
      User? user = result.user;

      if(user != null) {
        await _dbRef.child('users').child(user.uid).set({
          'email': email,
          'first_name': firstName,
          'second_name': secondName,
          'password': password,
          'created_at': DateTime.now().toIso8601String(),
        });
      } 
      return user;
     
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password);
        return result.user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}