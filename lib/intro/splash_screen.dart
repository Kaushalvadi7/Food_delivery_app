import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_delivery_app/intro/intro_screen.dart';
import 'package:food_delivery_app/services/auth/auth_gate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenIntro = prefs.getBool('hasSeenIntro') ?? false;

    if (!hasSeenIntro) {
      await prefs.setBool('hasSeenIntro', true);
    }

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => hasSeenIntro ? const AuthGate() : const IntroScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/zaikit_logo.png', // Animated splash
              width: 400,
              height: 140,
              fit: BoxFit.contain,
            ),
            // const SizedBox(height: 20),
            // Text(
            //   "Taste the Best, Forget the Rest!",
            //   style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            //     fontWeight: FontWeight.bold,
            //     color: Theme.of(context).colorScheme.primary,
            //   ),
            // ),
            // const SizedBox(height: 5),
            Text(
              "Delivering happiness at your doorstep!",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.inversePrimary,
              ),
                textAlign: TextAlign.center,

              // style: Theme.of(context).textTheme.bodyMedium,
              // textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
