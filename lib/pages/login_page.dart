import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/pages/profile_creation_page.dart';
import '../components/forgot_password_page.dart';
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
  final AuthService _authService = AuthService();
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
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    }
  }


  // Email login method
  void login() async {
    try {
      await _authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Login Failed"),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  // Google login method
  void googleLogin() async {
    try {
      final user = await _authService.loginWithGoogle();
      if (user != null) {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => ProfileCreationPage()),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google login failed: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.only(top: 142.0),
              child: Image.asset('assets/images/zaikit_logo.png', height: 200, width: 320),
            ),
            const SizedBox(height: 25),

            //message,app slogan
            Center(
              child: Text(" Welcome to Zaikit",
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),),
            ),
            const SizedBox(height: 24),

            // email text field
            MyTextField(
              controller: emailController,
              hintText:" Enter Your Email Address",
              obscureText: false,
            ),
            const SizedBox(height: 25),

            //password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                hintText:" Enter your Password",
                hintStyle:TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary
                ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
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
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ForgotPasswordPage();
                    }));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),


            const SizedBox(height: 20,),

            //sign in button
            MyButton(
                text: "Sign In",
                 onTap: login),

            const SizedBox(height: 20,),

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
            const SizedBox(height: 25),
            GestureDetector(
              onTap: googleLogin,
              child: Container(
                padding: const EdgeInsets.symmetric(
                 horizontal: 125),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/google.png', height: 75, width: 30),
                    const SizedBox(width: 10),
                    Text(
                      "Google",
                      style: TextStyle(
                        fontSize: 30,
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
      );
  }
}
