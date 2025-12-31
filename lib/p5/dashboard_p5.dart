import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardP5 extends StatelessWidget {
  final String? email = FirebaseAuth.instance.currentUser?.email;

  DashboardP5({super.key});

  @override
  // Suggested code may be subject to a license. Learn more: ~LicenseLog:3202015248.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to p5"),
      ), //AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to the Dashboard p5!"),
            SizedBox(
              height: 20,
             ),
              Text("Email: $email"),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () async{
                await FirebaseAuth.instance.signOut();
                if(context.mounted){
                Navigator.pushReplacementNamed(context, '/login');
                }
              },
              child: Text("Sign Out"),),
          ]
        ),
      )
    );
  }
}
