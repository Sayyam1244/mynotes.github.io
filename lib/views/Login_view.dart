import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            decoration:
                const InputDecoration(hintText: 'Please enter email address'),
          ),
          TextField(
            controller: _password,
            enableSuggestions: false,
            autocorrect: false,
            obscureText: true,
            decoration:
                const InputDecoration(hintText: 'Please enter password'),
          ),
          TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  final userCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email, password: password);
                  print(userCredential);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print("User not found");
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password');
                  }
                  // print(e.code);
                }
              },
              child: const Text('Login')),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/Register/", (route) => false);
              },
              child: const Text("Not Registered Yet, Register Now!"))
        ],
      ),
    );
  }
}

































// class LoginView extends StatefulWidget {
//   const LoginView({Key? key}) : super(key: key);

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   late final TextEditingController _email;
//   late final TextEditingController _password;

//   @override
//   void initState() {
//     _email = TextEditingController();
//     _password = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _email.dispose();
//     _password.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Login Screen"),
//       ),
//       body: FutureBuilder(
//         future: Firebase.initializeApp(
//             options: DefaultFirebaseOptions.currentPlatform),
//         builder: ((context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.done:
//               return Column(children: [
//                 TextField(
//                   controller: _email,
//                   enableSuggestions: false,
//                   autocorrect: false,
//                   decoration: const InputDecoration(
//                       hintText: 'Please enter your email address'),
//                 ),
//                 TextField(
//                   controller: _password,
//                   enableSuggestions: false,
//                   autocorrect: false,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                       hintText: 'Please enter your password'),
//                 ),
//                 TextButton(
//                     onPressed: () async {
//                       final email = _email.text;
//                       final password = _password.text;
//                       try {
//                         final userCredential = await FirebaseAuth.instance
//                             .signInWithEmailAndPassword(
//                                 email: email, password: password);
//                         print(userCredential);
//                       } on FirebaseAuthException catch (e) {
//                         if (e.code == 'user-not-found') {
//                           print("invalid email address please try again");
//                         } else if (e.code == "wrong-password") {
//                           print("invalid password please try again");
//                         } else {
//                           print("Something gone wrong");
//                         }
//                         print(e.code);
//                       }
//                     },
//                     child: const Text("Login"))
//               ]);
//             default:
//               return const Center(child: Text("Loading"));
//           }
//         }),
//       ),
//     );
//   }
// }
