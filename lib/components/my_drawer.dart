import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_tile.dart';
import 'package:food_delivery_app/pages/about_us.dart';
import 'package:food_delivery_app/services/auth/login_or_registration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/home_page.dart';
import '../pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Image.asset('assets/images/zaikit_logo.png',
            width: 280,height: 140,)
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home list title
          MyDrawerTile(
            text:"H O M E ",
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  HomePage(),
                ),
              );
             }
          ),

          //setting list tile
          MyDrawerTile(
            text:"S E T T I N G S ",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const SettingPage(),));
            },
          ),

          //About Us tile
          MyDrawerTile(
            text:"A B O U T  U S",
            icon: Icons.info_outline_rounded,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const AboutUs(),));
            },
          ),

          const Spacer(),

          //logout list tile
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () async {
              try {
                // Get current user's UID
                User? user = FirebaseAuth.instance.currentUser;

                if (user != null) {
                  SharedPreferences prefs = await SharedPreferences.getInstance();

                  await prefs.remove("sessionToken_${user.uid}");  // Example key for session tokens
                  await prefs.remove("lastLogin_${user.uid}");     // Example key for tracking last login
                  await prefs.remove("cartData_${user.uid}");      // Example key for user-specific cart data

                  
                }

                // Log out from Firebase
                await FirebaseAuth.instance.signOut();

                // Navigate to the login page, removing all previous routes
                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginOrRegister()),
                        (route) => false,
                  );
                }
              } catch (e) {
                // Handle errors
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error logging out: $e")),
                );
              }
            },
          ),

          const SizedBox(height: 25,)
        ],
      ),

    );
  }
}
