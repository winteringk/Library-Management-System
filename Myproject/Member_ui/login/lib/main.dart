// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:login/view/page1.view.dart';
// import 'package:login/database/mysql.dart';

void main() {
  runApp(const Myapp());
} // MyApp is a StatefulWidget. This allows updating the state of the

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      home: Myview(),
      // var db = new Database();
    );
  }
}
