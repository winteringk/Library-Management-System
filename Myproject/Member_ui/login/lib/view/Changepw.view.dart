import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/utils/Global.colors.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
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
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Change Password',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.mainColor,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
