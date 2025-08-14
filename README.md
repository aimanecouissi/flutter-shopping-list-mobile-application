# SHOPPING LIST MOBILE APPLICATION 🛒

Welcome to the Shopping List Mobile Application repository! This cross-platform app was developed as part of my 5th-year capstone project for the multiplatform development course. Built with Flutter and Firebase, it allows users to create, update, and manage shopping list items with category and quantity details. Data is synchronized in real time across devices, ensuring the list is always up to date.

## FEATURES ✨

- **User Authentication**: 🔒 Secure sign-up, login, and logout using Firebase Authentication.  
- **Add Items**: ➕ Create shopping list entries with category and quantity.  
- **Update Items**: ✏️ Edit existing items directly from the main list.  
- **Delete Items**: 🗑️ Swipe to remove unwanted items.  
- **Real-time Sync**: 🔄 All data is stored in Firebase Realtime Database and updated instantly across devices.  

## TECHNOLOGIES 🚀

- **Flutter**: 📱 Cross-platform UI toolkit for building natively compiled applications.  
- **Firebase Authentication**: 🔐 Provides secure email/password login and logout functionality.  
- **Firebase Realtime Database**: 🗄️ Stores and syncs shopping list data in real time.  

## DEMO 🎬

Explore the application in action by watching the video demonstration available on [YouTube](https://youtu.be/jF3Y9vs7XVo).

## INSTALLATION ⚙️

> Note: We assume that Android Studio and the Flutter SDK are already installed on your machine.  
> If not, please follow the official installation guide here: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install).

To run the application locally, follow these steps:

1. 📥 Clone the repository to your local machine.  
2. 📦 Install dependencies by running `flutter pub get`  
3. 🔥 Create a new Firebase project.  
4. 🗄️ Enable Realtime Database (in Test Mode for development).  
5. ✉️ Enable Email/Password Authentication in Authentication settings.  
6. 🚨 In the codebase, locate the line `const String firebaseDatabaseUrl = '<YOUR_FIREBASE_DATABASE_URL>';` and replace `<YOUR_FIREBASE_DATABASE_URL>` with your actual Firebase Realtime Database URL.  
7. 🛠️ Install the Firebase CLI by running `npm install -g firebase-tools`  
8. 🔑 Log in to Firebase using `firebase login`  
9. ⚙️ Install the FlutterFire CLI by running `dart pub global activate flutterfire_cli`  
   ⚠ If the installation shows a warning about PATH or missing config, follow the suggested fix before continuing.  
10. 🔄 From the project root, run `flutterfire configure`  
    - Select your Firebase project.  
    - When asked for the Android application ID, do not use the default `com.example.app`. Instead, use the `applicationId` from `android/app/build.gradle`.  
11. ▶️ Run the application using `flutter run`  

For more details, see the official guide: [https://firebase.google.com/docs/flutter/setup](https://firebase.google.com/docs/flutter/setup).

## CONTRIBUTING 🤝

Contributions are welcome! If you'd like to contribute to the project, please follow these steps:

1. 🍴 Fork the repository.  
2. 🌿 Create a new branch (`git checkout -b feature/my-new-feature`).  
3. ✨ Make your changes.  
4. 📝 Commit your changes (`git commit -am 'Add some feature'`).  
5. ⏫ Push to the branch (`git push origin feature/my-new-feature`).  
6. 📬 Create a new Pull Request.  

## LICENSE 📄

This project is licensed under the [MIT License](LICENSE).

## CONTACT 📧

For any inquiries or feedback, feel free to reach out to me at [contact@aimanecouissi.com](mailto:contact@aimanecouissi.com).
