import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:login/utils/Global.colors.dart';
import 'package:login/view/forgotpw.view.dart';
import 'package:login/view/menuprofile.view.dart';
import 'package:login/view/profile.view.dart';
import 'register.view.dart';
import 'package:http/http.dart' as http;
// import 'Widgets/text.form.global.dart';
import 'package:google_fonts/google_fonts.dart';

class Myloginview extends StatefulWidget {
  const Myloginview({super.key});

  @override
  State<Myloginview> createState() => _MyloginviewState();
}

class _MyloginviewState extends State<Myloginview> {
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;

  List _data = [];

  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailAddressController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  // Future<void> getData(String email, String password) async {
  //   final response = await http.post(
  //     Uri.parse('http://localhost:3000/data'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({
  //       'email': email,
  //       'password': password,
  //     }),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Container(
          // color: Colors.green, // layout color
          width: double.infinity,
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Sign In',
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
                'Sign in to your account',
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
                controller: emailAddressController,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Email is required'),
                  EmailValidator(errorText: 'Enter a valid email address'),
                ]),
                decoration: InputDecoration(
                  hintText: ' Email',
                  hintStyle: GoogleFonts.poppins(
                      color: Color.textColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w300),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Color.mainColor)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90),
                    borderSide: BorderSide(
                      color: Color.mainColor,
                    ),
                  ),
                ),
              ),

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
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !passwordVisibility,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Password is required'),
                  MinLengthValidator(6,
                      errorText: 'Password should be at least 6 digits'),
                  MaxLengthValidator(15,
                      errorText:
                          'Password should not be greater than 15 digits'),
                ]),
                decoration: InputDecoration(
                  hintText: ' Password',
                  hintStyle: GoogleFonts.poppins(
                      color: Color.textColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w300),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Color.mainColor)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90),
                    borderSide: BorderSide(
                      color: Color.mainColor,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisibility = !passwordVisibility;
                      });
                    },
                    icon: Icon(
                      passwordVisibility
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color.mainColor,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              // forgot password
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const Resetpassword());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(
                      color: Color.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              // Signin button
              InkWell(
                onTap: () {
                  Get.to(() => const Mymenu());
                  // if (_formKey.currentState!.validate()) {
                  //   if (getData(emailAddressController!.text,
                  //           passwordController!.text) ==
                  //       true) {

                  //   } else {
                  //     Get.snackbar(
                  //       'Error',
                  //       'Invalid Email or Password',
                  //       snackPosition: SnackPosition.BOTTOM,
                  //       backgroundColor: Colors.red,
                  //       colorText: Colors.white,
                  //     );
                  //   }
                  // }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.mainColor,
                    borderRadius: BorderRadius.circular(90),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.poppins(
                      // GoogleFonts is a package
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 50,
              ),

              // Signin with cmu account
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Or Sign In With',
                  style: GoogleFonts.poppins(
                    color: Color.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // Signin with CMU IT Account
              InkWell(
                onTap: () {
                  // ignore: avoid_print
                  print('Sign in with CMU IT Account');
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(90),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset(
                      //   'assets/images/cmu_logo.png',
                      //   height: 30,
                      //   width: 30,
                      // ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sign In with CMU IT Account',
                        style: GoogleFonts.poppins(
                          // GoogleFonts is a package
                          color: Color.mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      )),
      // Sign up
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: GoogleFonts.poppins(
                color: Color.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const MySignupview());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              child: Text(
                'Sign Up',
                style: GoogleFonts.poppins(
                  color: Color.mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
