import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/utils/Global.colors.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({super.key});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
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
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color.mainColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Reset Password',
                    style: GoogleFonts.poppins(
                      color: Color.mainColor,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Please enter your email address. You will receive a link to create a new password via email.',
                  style: GoogleFonts.poppins(
                    color: Color.mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Email',
                  style: GoogleFonts.poppins(
                    color: Color.mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: ' Enter your email',
                    hintStyle: GoogleFonts.poppins(
                      color: Color.textColor,
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Email is required'),
                    EmailValidator(errorText: 'Enter a valid email address'),
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                    child: Text(
                      'Send',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
