import 'package:flutter/material.dart';
import 'package:login_app/Screen/Signin.dart';
import 'package:login_app/Screen/Signup.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up/ Sign in"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(33, 211, 33, 0),
        child: SingleChildScrollView(
          child: Column(children: [
            // Image.asset("assets/images/BG.png"),
            SizedBox(
              // height: 20,
              width: double.infinity,
              child: ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("Sign up", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Mysignup();
                    }));
                  }),
            ),
            SizedBox(
              // height: 20,
              width: double.infinity,
              child: ElevatedButton.icon(
                  icon: const Icon(Icons.login),
                  label: const Text("Sign in", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const MySignin();
                    }));
                  }),
            )
          ]),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Coloumn({required List<SizedBox> children}) {}
