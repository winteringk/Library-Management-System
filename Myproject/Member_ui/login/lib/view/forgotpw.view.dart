import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/Widgets/buttonpassword.global.dart';
import 'package:login/view/Widgets/text.form.global.dart';
import 'package:login/utils/Global.colors.dart';

class Forgotpassword extends StatelessWidget {
  Forgotpassword({super.key});

  final TextEditingController emailController = TextEditingController();

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
                    'Forgot Password',
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
                  'Enter your email to reset your password',
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
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Email is required'),
                    EmailValidator(errorText: 'Enter a valid email address'),
                  ]),
                  controller: emailController,
                  text: 'Email',
                  textInputType: TextInputType.emailAddress,
                  obscureText: false,
                ),

                const SizedBox(
                  height: 15,
                ),

                // Reset Password button
                const ResetPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
