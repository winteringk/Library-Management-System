import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/view/Widgets/body.welcome.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

final Future<FirebaseApp> firebase = Firebase.initializeApp();

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BodyWelcome());
  }
}
