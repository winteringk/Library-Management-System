import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:login/utils/Global.colors.dart';
import 'package:login/view/Widgets/buttonpassword.global.dart';
import 'Widgets/button.global.dart';
import 'Widgets/cmu.global.dart';
import 'register.view.dart';
import 'Widgets/text.form.global.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLoginview extends StatelessWidget {
  MyLoginview({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TextformGlobal(
                controller: emailController,
                text: 'Email',
                obscureText: false,
                textInputType: TextInputType.emailAddress,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Email is required'),
                  EmailValidator(errorText: 'Enter a valid email address'),
                ]),
              ),

              const SizedBox(
                height: 15,
              ),

              // Password input
              TextformGlobal(
                controller: passwordController,
                text: 'Password',
                obscureText: true,
                textInputType: TextInputType.visiblePassword,
                validator: RequiredValidator(errorText: 'Password is required'),
              ),

              const SizedBox(
                height: 10,
              ),

              // forgot password
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ResetPassword());
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
              const Mybutton(),

              const SizedBox(
                height: 50,
              ),

              // Signin with cmu account
              const CMUSignin(),

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
                Get.to(() => Mysignupview());
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
