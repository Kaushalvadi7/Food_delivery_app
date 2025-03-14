import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/profile_creation_page.dart';
import 'login_or_registration.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context , snapshot) {

              //user is logged in
              if(snapshot.hasData){
                return const ProfileCreationPage();
              }

              // user is Not logged in
              else {
                return const LoginOrRegister();
              }
            }
        )
    );
  }
}


