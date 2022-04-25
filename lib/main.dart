import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetest/views/Login_view.dart';
import 'package:firebasetest/views/Verify_email.dart';
import 'package:firebasetest/views/register_view.dart';

import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: const HomePage(),
    routes: {
      '/Login/': (context) => const LoginView(),
      '/Register/': (context) => const RegisterView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: ((context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                print("Email is verified");
              } else {
                return VerifyEmailView();
              }
            } else {
              return LoginView();
            }
            return Text("Done");

          default:
            return const CircularProgressIndicator();
        }
      }),
    );
  }
}
