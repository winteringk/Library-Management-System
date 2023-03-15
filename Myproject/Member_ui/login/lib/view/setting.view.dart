import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/utils/Global.colors.dart';

class Mysetting extends StatefulWidget {
  const Mysetting({super.key});

  @override
  State<Mysetting> createState() => _MysettingState();
}

class _MysettingState extends State<Mysetting> {
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
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
                        'Setting',
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Dark Mode',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.mainColor,
              ),
            ),
            trailing: Switch(
              value: _isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _isDarkModeEnabled = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
