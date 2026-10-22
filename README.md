# SHOPPING LIST MOBILE APPLICATION 🛒

A 5th-year capstone project for the multiplatform development course, built with Flutter and Firebase. Users can create, view, and delete shopping list items with category and quantity details, with data stored in Firebase Realtime Database.

## FEATURES ✨

- **User Authentication** — Sign up, log in, and log out using Firebase Authentication.
- **Add Items** — Create shopping list entries with a name, category, and quantity.
- **View Items** — Display saved items with their quantities and color-coded categories.
- **Delete Items** — Swipe to remove unwanted items.
- **Cloud Data Storage** — Store shopping list items in Firebase Realtime Database and retrieve them when loading the list.

## TECHNOLOGIES 🚀

- **Flutter** — Cross-platform UI toolkit for building natively compiled applications.
- **Dart** — Programming language used for application development.
- **Firebase Authentication** — Email/password authentication and session management.
- **Firebase Realtime Database** — Cloud database used to store shopping list items.
- **HTTP** — Library used to communicate with Firebase Realtime Database through its REST API.

## DEMO 🎬

Watch the demo on [YouTube](https://youtu.be/jF3Y9vs7XVo).

## PREREQUISITES 📋

Before getting started, ensure you have the following:

- **Flutter SDK** — With a compatible Dart SDK satisfying the project's declared constraint of `>=3.2.3 <4.0.0`.
- **Android SDK** — With an emulator or physical Android device for local testing.
- **Node.js and npm** — Required for installing the Firebase CLI.
- **Firebase Account** — Required to create and configure a Firebase project.

Android Studio can be used to manage the Android SDK and emulators. For installation instructions, see the [official Flutter installation guide](https://docs.flutter.dev/get-started/install).

## INSTALLATION ⚙️

1. Clone the repository to your local machine.
2. Install the Flutter dependencies: `flutter pub get`.
3. Create a new project in the [Firebase Console](https://console.firebase.google.com/).
4. Enable **Email/Password Authentication** in Firebase Authentication.
5. Create a **Firebase Realtime Database** for development.
6. Install the Firebase CLI: `npm install -g firebase-tools`.
7. Log in to Firebase: `firebase login`.
8. Install the FlutterFire CLI: `dart pub global activate flutterfire_cli`.
9. From the project root, run `flutterfire configure`:
    - Select your Firebase project and target platform.
    - For Android, use the application ID defined in `android/app/build.gradle`, currently `com.example.shopping_list`.
    - Ensure the generated `lib/firebase_options.dart` file is available before running the application.
10. In `lib/widgets/new_item.dart` and `lib/widgets/shopping_list.dart`, replace the database host placeholders with your Firebase Realtime Database hostname, without `https://` or a URL path.
11. Configure the Realtime Database rules for development. The application's current REST requests do not send Firebase authentication tokens, so enabling Firebase Authentication alone does not authorize database requests.
12. Start an emulator or connect a supported device, then run the application: `flutter run`.

For more details, see the [official Firebase Flutter setup guide](https://firebase.google.com/docs/flutter/setup).

The application uses individual HTTP requests to load and update stored data; automatic live synchronization and editing of existing items are not implemented in the current source.

## CONTRIBUTING 🤝

Contributions are welcome! Please follow these guidelines:

1. Follow the existing project structure and coding conventions.
2. Use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages.
3. Test your changes locally whenever possible.
4. Update the documentation when introducing new features or changing existing functionality.

## LICENSE 📄

This project is licensed under the [MIT License](LICENSE).

## CONTACT 📧

For any questions or feedback, reach out at [contact@aimanecouissi.com](mailto:contact@aimanecouissi.com).
