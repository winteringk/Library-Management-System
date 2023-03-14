import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:login/utils/Global.colors.dart';
import 'package:login/view/login.view.dart';

class MySignupview extends StatefulWidget {
  const MySignupview({super.key});

  @override
  State<MySignupview> createState() => _MySignupviewState();
}

class _MySignupviewState extends State<MySignupview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Form(
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
                  Text(
                    "Email",
                    style: GoogleFonts.poppins(
                        color: Color.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                      // validator: MultiValidator([
                      //   RequiredValidator(errorText: "Email is required"),
                      //   EmailValidator(errorText: "Enter a valid email address")
                      // ]),

                      ),

                  const SizedBox(
                    height: 15,
                  ),

                  // Username input
                  Text(
                    "Username",
                    style: GoogleFonts.poppins(
                        color: Color.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  TextFormField(),

                  const SizedBox(
                    height: 15,
                  ),

                  // Password input
                  Text(
                    "Password",
                    style: GoogleFonts.poppins(
                        color: Color.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  TextFormField(),

                  const SizedBox(
                    height: 15,
                  ),

                  // Confirm Password input
                  Text(
                    "Confirm Password",
                    style: GoogleFonts.poppins(
                        color: Color.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  TextFormField(),

                  const SizedBox(
                    height: 15,
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  // Sign up button
                  SizedBox(
                    width: double.infinity,
                    // alignment: Alignment.center,
                    child: ElevatedButton(
                      child: Text(
                        "SIGN UP",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        MyLoginview();
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 120,
                  ),
                ],
              ),
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
