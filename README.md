# SHOPPING LIST MOBILE APPLICATION 🛒

A 5th-year capstone project for the multiplatform development course, built with Flutter and Firebase. Users can create, update, and manage shopping list items with category and quantity details. Data is synchronized in real time across devices.

## FEATURES ✨

- **User Authentication** — Sign up, log in, and log out using Firebase Authentication.
- **Add Items** — Create shopping list entries with a name, category, and quantity.
- **Update Items** — Edit existing items directly from the main list.
- **Delete Items** — Swipe to remove unwanted items.
- **Real-time Sync** — All data is stored in Firebase Realtime Database and updated instantly across devices.

## TECHNOLOGIES 🚀

- **Flutter** — Cross-platform UI toolkit for building natively compiled applications.
- **Firebase Authentication** — Secure email/password login and logout.
- **Firebase Realtime Database** — Real-time data storage and synchronization.

## DEMO 🎬

Watch the demo on [YouTube](https://youtu.be/jF3Y9vs7XVo).

## INSTALLATION ⚙️

> This guide assumes you have Android Studio and the Flutter SDK installed. If not, follow the [official Flutter installation guide](https://docs.flutter.dev/get-started/install).

1. Clone the repository to your local machine.
2. Install dependencies: `flutter pub get`.
3. Create a new Firebase project.
4. Enable **Realtime Database** in Test Mode for development.
5. Enable **Email/Password Authentication** in the Authentication settings.
6. In `lib/widgets/new_item.dart` and `lib/widgets/shopping_list.dart`, replace `<YOUR_FIREBASE_DATABASE_URL>` with your actual Firebase Realtime Database URL.
7. Install the Firebase CLI: `npm install -g firebase-tools`.
8. Log in to Firebase: `firebase login`.
9. Install the FlutterFire CLI: `dart pub global activate flutterfire_cli`.
10. From the project root, run `flutterfire configure`:
    - Select your Firebase project.
    - When prompted for the Android application ID, use the `applicationId` from `android/app/build.gradle` instead of the default `com.example.shopping_list`.
11. Run the application: `flutter run`.

For more details, see the [official Firebase Flutter setup guide](https://firebase.google.com/docs/flutter/setup).

## CONTRIBUTING 🤝

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/my-new-feature`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add feature description'`).
5. Push to the branch (`git push origin feature/my-new-feature`).
6. Open a Pull Request.

## LICENSE 📄

This project is licensed under the [MIT License](LICENSE).

## CONTACT 📧

For any questions or feedback, reach out at [contact@aimanecouissi.com](mailto:contact@aimanecouissi.com).
