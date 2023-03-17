import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/utils/Global.colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Mysetting extends StatefulWidget {
  const Mysetting({super.key});

  @override
  State<Mysetting> createState() => _MysettingState();
}

class _MysettingState extends State<Mysetting> {
  bool _isDarkModeEnabled = false;
  // List _data = [];

  // Future<void> getData() async {
  //   final url = await http.get(Uri.parse('http://localhost:3000/data'));
  //   final jsonData = json.decode(url.body);

  //   setState(() {
  //     _data = jsonData;
  //   });
  // }

  // Future<void> deleteData() async {
  //   final response = await http.post(
  //     Uri.parse('http://localhost:3000/data'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //   );
  // }

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
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              // deleteData();
            },
            child: Container(
              alignment: Alignment.center,
              // padding: const EdgeInsets.only(left: 20),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.mainColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Text(
                'Delete Account',
                style: GoogleFonts.poppins(
                  // GoogleFonts is a package
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
