# 🛵 Zaikit: - Food Delivery App 🍔📱 
[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-%23FFCA28.svg?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Zaikit is a meticulously crafted mobile application built with Flutter, designed to provide a seamless and enjoyable food ordering experience. Zaikit aims to be your go-to companion for satisfying those hunger pangs.

This project showcases a modern and intuitive user interface coupled with a robust backend powered by Firebase, offering a comprehensive solution for both customers and potentially restaurant owners (with future expansions in mind!).

## Features 🚀  
✅ **Intuitive User Interface** – Smooth navigation with a **tab bar, drawer, and bottom navigation bar**.  
✅ **Email Authentication** – Secure user login and registration.  
✅ **Google Authentication** – Quick sign-in using Google accounts.  
✅ Browse a **variety of food items** from different categories  
✅ **Add items to cart** and place orders effortlessly.  
✅ **Secure online payments** via Razorpay.  
✅ **Local Notifications:** Receive real-time updates on your order status via local notifications.  
✅ **Invoice Generation:** Generate and view detailed invoices for your completed orders.  
✅ **Track order history** and real-time updates.    
✅ **Manage delivery addresses** for a hassle-free experience    

Zaikit ensures a smooth, user-friendly, and efficient food ordering process with **responsive UI, smooth navigation, and all essential food delivery features.**  

## 🛠️ Built Using:

* **Flutter:** For a beautiful and performant cross-platform user interface.
* **Dart:** The powerful language behind Flutter.
* **Firebase:** Providing a robust backend with:
    * **Authentication:** Secure user accounts.
    * **Firestore:** Real-time database for restaurants, menus, and orders.
      
##  📂 Project Structure
 
- 📦 **lib/**
  - 📂 **components/** → Reusable widgets (buttons, app bars, etc.)  
  - 📂 **models/** → Data models (Restaurant, CartItem, etc.)  
  - 📂 **screens/** → Main screens (Home, Login, Cart, etc.)  
  - 📂 **services/** → Firebase services (Auth, Database)  
  - 📜 **main.dart** → Entry point of the application  

## ⚙️ Getting Started:
 **Prerequisites:/**

  -Make sure you have Flutter installed. 
  -Check with: flutter --version

1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/Kaushalvadi7/Food_delivery_app.git](https://www.google.com/search?q=https://github.com/Kaushalvadi7/Food_delivery_app.git)
    cd Food_delivery_app
    ```

2.  **Set up Firebase:**
    * Create a new project on the [Firebase Console](https://console.firebase.google.com/).
    * Enable **Authentication**, **Firestore**, and **Storage** in your Firebase project.
    * Create iOS and Android apps within your Firebase project.
    * Download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) configuration files and place them in the appropriate `android/app/` and `ios/Runner/` directories, respectively.
    * **Important:** Configure your Firebase project with the necessary rules for Firestore and Storage to ensure data security.

3.  **Install Flutter Dependencies:**
    ```bash
    flutter pub get
    ```

4.  **Run the Application:**
    ```bash
    flutter run
    ```

   Choose your desired target device or emulator.

## 🚀 Future Enhancements:

Zaikit is a constantly evolving project. Here are some exciting features planned for the future:

* **Restaurant Owner Portal:** A separate interface for restaurants to manage their menus, orders, and availability.
* **Advanced Search and Filtering:** Implement more sophisticated search options based on cuisine, dietary restrictions, price range, and ratings.
* **User Reviews and Ratings:** Allow users to rate and review restaurants and individual dishes.
* **Promotions and Discounts:** Implement a system for restaurants to offer special deals and discounts.
* **Push Notifications:** Send users real-time updates on order status and promotional offers.
* **Location-Based Services:** Enhance the app with more precise location-based features.

## ❤️ Contributing:

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have suggestions for improvement, bug reports, or would like to contribute code, please feel free to:

1.  Fork the project
2.  Create your feature branch (`git checkout -b feature/amazing-feature`)
3.  Commit your changes (`git commit -m 'Add some amazing feature'`)
4.  Push to the branch (`git push origin feature/amazing-feature`)
5.  Open a Pull Request

## 📞 Contact & Support
  - For any queries or issues, reach out:
  - 📧 Email: kaushalvadi7777@gmail.com 
  - 🌐 GitHub: [Kaushalvadi7](https://github.com/Kaushalvadi7)  
