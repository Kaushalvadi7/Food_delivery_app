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
  final AuthService _authService =AuthService();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _checkUserLogin();
  }

  // Check if the user is already logged in
  void _checkUserLogin() {
    final user = _authService.getCurrentUser();
    if (user != null) {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    }
  }


  // Email login method
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

  // Google login method
  void googleLogin() async {
    try {
      print("🔹 Google Login Button Clicked");
      final user = await _authService.loginWithGoogle();
      if (user != null) {
        print("✅ Google Login Successful: ${user.user?.email}");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        print("❌ Google Sign-In was cancelled");
      }
    } catch (e) {
      print("❌ Google login failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google login failed: ${e.toString()}")),
      );
    }
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
              Image.asset('assets/images/logo.png', height: 150, width: 200),

              //message,app slogan
              Center(
                child: Text(" Welcome to Zaikit",
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),),
              ),
              const SizedBox(height: 15),

              // email text field
              MyTextField(
                controller: emailController,
                hintText:" Enter Your Email Address",
                obscureText: false,
              ),
              const SizedBox(height: 15),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                  hintText:" Enter your Password",
                  hintStyle:TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                  ),
                  suffixIcon: IconButton(
                  icon: Icon(
                  _isPasswordVisible? Icons.visibility : Icons.visibility_off,
                  color: _isPasswordVisible ? Colors.blue : Colors.grey,
                   ),
                  onPressed: () {
                    setState(() {
                       _isPasswordVisible = !_isPasswordVisible;
                    });
                     },
                     ),
                  ),
                ),
              ),
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

              const SizedBox(height: 15,),

              //sign in button
              MyButton(
                  text: "Sign In",
                   onTap: login),

              const SizedBox(height: 15,),

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
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: googleLogin,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 125),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/google.png', height: 30, width: 30),
                      const SizedBox(width: 10),
                      Text(
                        "Google",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      );
  }
}
