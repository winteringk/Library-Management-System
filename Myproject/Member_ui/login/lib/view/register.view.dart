import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:login/utils/Global.colors.dart';
import 'package:login/view/login.view.dart';
import 'package:path/path.dart';

class MySignupview extends StatefulWidget {
  const MySignupview({Key? key}) : super(key: key);

  @override
  State<MySignupview> createState() => _MySignupviewState();
}

class _MySignupviewState extends State<MySignupview> {
  // Define text editing controllers
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  TextEditingController? usernameController;

  // Define key for validating form
  final _formKey = GlobalKey<FormState>();

  // Define list of data to display
  List _data = [];

  // Define flag for showing/hiding password
  bool _obscureText = false;
  bool _obscureText1 = false;

  // Define scaffold key for displaying snackbar messages
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String email;

  late String username;

  late String password;

  @override
  void initState() {
    super.initState();

    // Initialize text editing controllers
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    usernameController = TextEditingController();

    // Fetch data from server
    //   getData();
    // }

    // Fetch data from server
    // Future<void> getData() async {
    //   final url = await http.get(Uri.parse('http://localhost:3000/data'));
    //   final jsonData = json.decode(url.body);

    //   setState(() {
    //     _data = jsonData;
    //   });
    // }

    // Post data to server
    // Future<void> postData(String username, String email, String password) async {
    //   final response = await http.post(
    //     Uri.parse('http://localhost:3000/data'),
    //     headers: {
    //       'Content-Type': 'application/json',
    //     },
    //     body: json.encode({
    //       'username': username,
    //       'email': email,
    //       'password': password,
    //     }),
    //   );

    // Fetch updated data from server
    //   getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Form(
              // Associate form key with form
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      color: Color.mainColor,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Email is required"),
                      EmailValidator(errorText: "Enter a valid email address")
                    ]),
                    controller: emailAddressController,
                    decoration: InputDecoration(
                      hintText: " Email",
                      hintStyle: GoogleFonts.poppins(
                          color: Color.textColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                        borderSide: BorderSide(
                          color: Color.mainColor,
                        ),
                      ),
                      filled: true,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                    ),
                    onChanged: (value) {
                      setState(() {
                        // eror
                        email = value;
                      });
                    },
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
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Username is required"),
                      MinLengthValidator(6,
                          errorText: "Username should be at least 6 digits"),
                      MaxLengthValidator(15,
                          errorText:
                              "Username should not be greater than 15 digits")
                    ]),
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: " Username",
                      hintStyle: GoogleFonts.poppins(
                          color: Color.textColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                        borderSide: BorderSide(
                          color: Color.mainColor,
                        ),
                      ),
                      filled: true,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                    ),
                    onChanged: (value) {
                      setState(() {
                        //error
                        username = value;
                      });
                    },
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
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Password is required"),
                      MinLengthValidator(6,
                          errorText: "Password should be at least 6 digits"),
                      MaxLengthValidator(15,
                          errorText:
                              "Password should not be greater than 15 digits"),
                    ]),
                    obscureText: _obscureText,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: " Password",
                      hintStyle: GoogleFonts.poppins(
                          color: Color.textColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                        borderSide: BorderSide(
                          color: Color.mainColor,
                        ),
                      ),
                      filled: true,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                      suffixIcon: InkWell(
                        onTap: () => setState(() {
                          _obscureText = !_obscureText;
                        }),
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color.mainColor,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        //error
                        password = value;
                      });
                    },
                  ),

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
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Password is required"),
                      MinLengthValidator(6,
                          errorText: "Password should be at least 6 digits"),
                      MaxLengthValidator(15,
                          errorText:
                              "Password should not be greater than 15 digits"),
                    ]),
                    obscureText: _obscureText1,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      hintText: " Confirm Password",
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
                      filled: true,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                      suffixIcon: InkWell(
                        onTap: () => setState(() {
                          _obscureText1 = !_obscureText1;
                        }),
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          _obscureText1
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color.mainColor,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  // Sign up button
                  InkWell(
                    onTap: () {
                      Get.to(const Myloginview());
                      //error
                      // if (_formKey.currentState!.validate()) {
                      //   if (passwordController?.text ==
                      //       confirmPasswordController?.text) {
                      //     // ignore: avoid_print
                      //     postData(
                      //         emailAddressController!.text,
                      //         usernameController!.text,
                      //         passwordController!.text);

                      //   } else {
                      //     // ignore: avoid_print
                      //     print("Password does not match");
                      //   }
                      // }
                      // ignore: avoid_print
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
                        'Sign Up',
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
                  Get.to(const Myloginview());
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
