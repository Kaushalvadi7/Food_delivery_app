import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/setting_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/profile_placeholder.png"), // Replace with user's image
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "ABC",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text("abc@example.com", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Saved Addresses
            _buildSectionTitle("Saved Addresses"),
            _buildListTile(Icons.location_on, "Home Address", "123, Street Name, City", onTap: () {}),
            _buildListTile(Icons.add_location, "Add New Address", "Add a new delivery address", onTap: () {}),

            // Order History
            _buildSectionTitle("Order History"),
            _buildListTile(Icons.history, "View Past Orders", "Check your previous orders", onTap: () {}),

            // Payment Methods
            _buildSectionTitle("Payment Methods"),
            _buildListTile(Icons.payment, "Manage Payments", "UPI, Cards,", onTap: () {}),

            // Settings
            _buildSectionTitle("Settings"),
            _buildListTile(Icons.settings, "Settings", "Manage settings", onTap: () {
              // Navigate to SettingPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
              );
            }),
          ],
        ),
      ),
    );
  }

  // Helper Function to Build Section Titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper Function to Build List Tiles
  Widget _buildListTile(IconData icon, String title, String subtitle, {VoidCallback? onTap}) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
