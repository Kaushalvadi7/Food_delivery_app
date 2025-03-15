import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_tile.dart';
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
            child: Image.asset('assets/images/logo.png',
            width: 200,height: 100,)
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
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

                  // // ✅ Clear ONLY the logged-in user's session data
                  // await prefs.remove("userName_${user.uid}");
                  // await prefs.remove("email_${user.uid}");
                  // await prefs.remove("phoneNumber_${user.uid}");
                  // await prefs.remove("address_${user.uid}");

                  // ❗ DO NOT remove `isProfileCreated_${user.uid}` to preserve profile status
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
