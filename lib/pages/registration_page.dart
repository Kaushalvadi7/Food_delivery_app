import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../services/auth/auth_service.dart';

class RegistrationPage extends StatefulWidget {
  final void Function()? onTap;

  const RegistrationPage({super.key, required this.onTap,});
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  //test editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  //register method
  void register() async {
    //get auth service
    final authService = AuthService();

    // check if passwords match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      //try creating user
      try {
        await authService.signUpWithEmailPassword(emailController.text, passwordController.text,);
      }
      //display any errors
      catch (e) {
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ));
      }
    }
      // if passwords don.t match -> show error
        else {
           showDialog(context: context, builder: (context) => AlertDialog(
             backgroundColor: Theme.of(context).colorScheme.surface,
               title: Text("Passwords don't match!"),
           ));
       }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView (
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App logo
                Icon(
                  Icons.person_2,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(height: 25),

                //message,app slogan
                Text("Let's create an account for you",
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
                //confirm password
                MyTextField(
                  controller: confirmPasswordController,
                  hintText:" Re-Enter your Password",
                  obscureText: true,
                ),

                const SizedBox(height: 25,),

                //Register up button
                MyButton(
                  text: "Sign Up",
                  onTap: register),

                const SizedBox(height: 25,),

                // already have an account? Login here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                      style: TextStyle( color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16),),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("Login here", style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
