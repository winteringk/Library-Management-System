import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../model/profile.dart';

class Mysignup extends StatefulWidget {
  @override
  State<Mysignup> createState() => _MysignupState();
}

class _MysignupState extends State<Mysignup> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '', phone: '', username: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(39, 227, 39, 0),
          child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("SIGN UP", style: const TextStyle(fontSize: 20)),
                    TextFormField(
                      validator:
                          RequiredValidator(errorText: "Email is required"),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String email) {
                        profile.email = email;
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter your email",
                        labelText: "Email",
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator:
                          RequiredValidator(errorText: "Username is required"),
                      onSaved: (String username) {
                        profile.username = username;
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter your username",
                        labelText: "Username",
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator:
                          RequiredValidator(errorText: "Password is required"),
                      obscureText: true,
                      onSaved: (String password) {
                        profile.password = password;
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter your password",
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator:
                          RequiredValidator(errorText: "Phone is required"),
                      keyboardType: TextInputType.phone,
                      onSaved: (String phone) {
                        profile.phone = phone;
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter your phone",
                        labelText: "Phone",
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            print(
                                "email: ${profile.email}, username: ${profile.username}, password: ${profile.password}, phone: ${profile.phone}");
                            formKey.currentState.reset();
                          }
                        },
                        child: const Text("Sign up"),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
