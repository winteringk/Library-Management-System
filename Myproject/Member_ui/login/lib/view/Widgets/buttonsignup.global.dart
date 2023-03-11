// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/utils/Global.colors.dart';
import 'package:login/view/Widgets/profile.dart';
import 'package:login/view/login.view.dart';

class MybuttonSignup extends StatelessWidget {
  MybuttonSignup({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  Profile profile = Profile(
      email: '',
      firstname: '',
      lastname: '',
      password: '',
      phone: '',
      username: '');

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          // test saved state
          try {
            FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: profile.email, password: profile.password)
                .then((value) => print(value.user!.email));
            // .catchError((error) => print(error));
            formKey.currentState!.reset();
            Get.to(MyLoginview());
            // Get.to(Myotpform());
          } on FirebaseAuthException catch (e) {
            print(e);
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.mainColor,
          borderRadius: BorderRadius.circular(60),
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
    );
  }
}
