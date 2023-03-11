import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:login/utils/Global.colors.dart';
import 'package:login/view/welcome.view.dart';

class Myview extends StatelessWidget {
  const Myview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Get.to(const Welcome());
    });
    return Scaffold(
        backgroundColor: Color.mainColor,
        body: Center(
            child: Image.asset('assets/images/Chiang_Mai_University.png',
                width: 200, height: 200)));
  }
}
