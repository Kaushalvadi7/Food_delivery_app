import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';

import '../services/auth/auth_service.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

   const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //test editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // get instance of auth service
  final AuthService authService =AuthService();

  // login method
  void login() async{
    // Check if a user is already logged in
    if (FirebaseAuth.instance.currentUser != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("You're already logged in.")),
      );
      return;
    }
    // proceed with login
    final authService = AuthService();
    try{
      await authService .signInWithEmailPassword(emailController.text,
          passwordController.text);

      // Navigate to the home page after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );

    }
    //display any errors
    catch (e) {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ));
    }
  }

  // forget password method
  void forgotpassword(){
    showDialog(context: context, builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
       title: const Text("User tapped forgot password."),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                  Icons.lock_open_rounded,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 25),

              //message,app slogan
              Text(" Welcome to Food Delivery App",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),),

              const SizedBox(height: 25),

              // email text field
              MyTextField(
                controller: emailController,
                hintText:" Enter your Email",
                obscureText: false,
              ),
              const SizedBox(height: 25,),

              //password
              MyTextField(
                controller: passwordController,
                hintText:" Enter your Password",
                obscureText: true,
              ),
              const SizedBox(height: 25,),

              // Forgot Password (Clickable Text)
              // GestureDetector(
              //   onTap: forgotpassword,
              //   child: Text(
              //     "Forgot Password?",
              //     style: TextStyle(
              //       color: Theme.of(context).colorScheme.inversePrimary,
              //       fontSize: 14,
              //       fontWeight: FontWeight.bold,
              //       decoration: TextDecoration.underline, // Optional: Adds underline for better visibility
              //     ),
              //   ),
              // ),

              const SizedBox(height: 25,),

              //sign in button
              MyButton(
                  text: "Sign In",
                   onTap: login),

              const SizedBox(height: 25,),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16),),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text("Register now ", style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      );
  }
}
