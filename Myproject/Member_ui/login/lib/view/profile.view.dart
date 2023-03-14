import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/utils/Global.colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            // color: Colors.green, // layout color
            width: double.infinity,
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
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
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/59374587?v=4'),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Name',
                  style: GoogleFonts.poppins(
                    color: Color.mainColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Email',
                  style: GoogleFonts.poppins(
                    color: Color.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Phone',
                  style: GoogleFonts.poppins(
                    color: Color.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Address',
                  style: GoogleFonts.poppins(
                    color: Color.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
