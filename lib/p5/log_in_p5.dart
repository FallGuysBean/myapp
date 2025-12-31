// ignore_for_file: avoid_print



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogInP5Screen extends StatefulWidget {
  const LogInP5Screen({super.key});

  @override
  State<LogInP5Screen> createState() => _LogInP5ScreenState();
}

class _LogInP5ScreenState extends State<LogInP5Screen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text
      );
      if(!mounted){

        return;
      }
      Navigator.pushReplacementNamed(context, '/dashboard');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password, try again.');
          } else{
            print('Error: {$e.code}');
          }
        }
    } 
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Please Sign In P5')
        ),
        body: Center(
          //child: Padding (
              //padding:EdgeInsets.only(50)
                child: Column(
                    children: [
                      Text('Please Sign In P5'),
                      //SizedBox(height: 20),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(hintText: 'Email'),
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(hintText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10), 
                      GestureDetector(
                        onTap:signIn, 
                        child: Container(
                          padding: EdgeInsets.all(25),
                          child: Center(
                            child: Text("Sign In")
                          
                          ),
                        ),
                      ),
                    ],
        ), 
      )
    );  
  }
}