import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  // Function to launch Email
  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: 'zaikit@gmail.com');
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    }
  }

  // Function to launch Phone
  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+919876543210');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
    }
  }

  // Function to launch Google Maps
  Future<void> _launchMap() async {
    final Uri mapUri = Uri.parse("https://www.google.com/maps/search/?api=1&query=Anand,Gujarat");
    if (await canLaunchUrl(mapUri)) {
      await launchUrl(mapUri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Us",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                "Welcome to Zaikit!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Introduction
              Text(
                "Zaikit is an advanced food delivery platform designed to bring your favorite meals to your doorstep with ease. "
                    "Our platform connects you with the best restaurants, offering a wide range of cuisines to satisfy every craving."
                    "\nWe understand that food delivery is about more than just convenience—it’s about enjoying fresh, delicious meals on time. "
                    "Our dedicated team works tirelessly to ensure a smooth and satisfying experience, from placing an order to receiving it at your doorstep.",
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),

              // Mission Statement
              const Text(
                "Our Mission",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "At Zaikit, our mission is to revolutionize the food delivery experience by offering seamless service, "
                    "real-time tracking, and a user-friendly interface. We prioritize quality, speed, and customer satisfaction in every order.",
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),

              // Contact Section
              const Text(
                "Contact Us",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.email, color: Colors.blue),
                title: const Text("zaikit@gmail.com"),
                onTap: _launchEmail,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.phone, color: Colors.green),
                title: const Text("+91 9876543210"),
                onTap: _launchPhone,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.location_on, color: Colors.red),
                title: const Text("Anand, Gujarat"),
                onTap: _launchMap,
              ),

              const SizedBox(height: 20),
              // Footer
              Center(
                child: Text(
                  "© 2025 Zaikit. All Rights Reserved.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
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
