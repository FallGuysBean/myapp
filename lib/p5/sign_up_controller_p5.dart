// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class SignUpControllerP5 {
  String? email;
  String? password;
  User? user;

  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String password) {
    this.password = password;
  }


  Future<void> completeSignUp(String email, String password) async {
    
    this.email = email;
    this.password = password;
    await createNewFirebaseUser();
    print("Sign Up Successful");
        
    }

    Future<void> createNewFirebaseUser() async {
      try{
        UserCredential userCredential 
          = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!,
          password: password!
        );
      
       user = userCredential.user;
       
      print('user created with UID: ${user?.uid} and email: $user?.email)');
    } on FirebaseAuthException catch (e) {
      print('Error saving user data $e');
    }
  }
}