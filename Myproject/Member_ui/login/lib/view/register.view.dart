import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:login/utils/Global.colors.dart';
import 'package:login/view/Widgets/buttonsignup.global.dart';
import 'package:login/view/Widgets/profile.dart';
import 'package:login/view/login.view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widgets/textformsignup.global.dart';

// ignore: must_be_immutable
class Mysignupview extends StatelessWidget {
  Mysignupview({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Profile profile = Profile(
      email: '',
      firstname: '',
      lastname: '',
      password: '',
      phone: '',
      username: '');

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      color: Color.mainColor,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Sign up to your account',
                  style: GoogleFonts.poppins(
                      color: Color.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),

                const SizedBox(
                  height: 15,
                ),

                // Email input
                TextSignupformGlobal(
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Email is required"),
                    EmailValidator(errorText: "Enter a valid email address")
                  ]),
                  controller: emailController,
                  text: 'Email',
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                  onSaved: (String email) {
                    profile.email = email;
                  },
                ),

                const SizedBox(
                  height: 15,
                ),

                // Username input
                TextSignupformGlobal(
                  controller: usernameController,
                  text: 'Username',
                  obscureText: false,
                  textInputType: TextInputType.name,
                  validator:
                      RequiredValidator(errorText: "Username is required"),
                  onSaved: (String username) {
                    profile.username = username;
                  },
                ),

                const SizedBox(
                  height: 15,
                ),

                // Password input
                TextSignupformGlobal(
                  controller: confirmpasswordController,
                  text: 'Password',
                  obscureText: true,
                  textInputType: TextInputType.visiblePassword,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Password is required"),
                    MinLengthValidator(6,
                        errorText: "Password must be at least 6 digits long"),
                    MaxLengthValidator(15,
                        errorText:
                            "Password must not be greater than 15 digits long")
                  ]),
                  onSaved: (String password) {
                    profile.password = password;
                  },
                ),

                const SizedBox(
                  height: 15,
                ),

                // Confirm Password input
                TextSignupformGlobal(
                  controller: passwordController,
                  text: 'Confirm Password',
                  obscureText: true,
                  textInputType: TextInputType.visiblePassword,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Password is required"),
                    // MatchValidator(errorText: 'passwords do not match').validateMatch(passwordController.text, confirmpasswordController.text)
                  ]),
                  onSaved: (String password) {
                    profile.password = password;
                  },
                ),

                const SizedBox(
                  height: 15,
                ),

                // Firstname input
                TextSignupformGlobal(
                  controller: firstnameController,
                  text: 'Firstname',
                  obscureText: false,
                  textInputType: TextInputType.name,
                  validator:
                      RequiredValidator(errorText: "Firstname is required"),
                  onSaved: (String firstname) {
                    profile.firstname = firstname;
                  },
                ),

                const SizedBox(
                  height: 15,
                ),

                // Lastname input
                TextSignupformGlobal(
                  controller: lastnameController,
                  text: 'Lastname',
                  obscureText: false,
                  textInputType: TextInputType.name,
                  validator:
                      RequiredValidator(errorText: "Lastname is required"),
                  onSaved: (String lastname) {
                    profile.lastname = lastname;
                  },
                ),

                const SizedBox(
                  height: 15,
                ),

                //Phone input
                TextSignupformGlobal(
                  controller: phoneController,
                  text: 'Phone',
                  obscureText: false,
                  textInputType: TextInputType.phone,
                  validator: RequiredValidator(errorText: "Phone is required"),
                  onSaved: (String phone) {
                    profile.phone = phone;
                  },
                ),

                const SizedBox(
                  height: 15,
                ),
                // Sign up button
                MybuttonSignup(),

                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
      // Sign in
      bottomNavigationBar: Container(
          height: 50,
          color: Colors.white,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: GoogleFonts.poppins(
                    color: Color.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              TextButton(
                onPressed: () {
                  Get.to(MyLoginview());
                },
                child: Text(
                  'Sign In',
                  style: GoogleFonts.poppins(
                      color: Color.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )),
    );
  }
}
