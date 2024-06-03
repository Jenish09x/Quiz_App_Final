import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_exam/utils/screen_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: screen_routes,
    ),
  );
}
