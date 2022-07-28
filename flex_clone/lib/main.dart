import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/controller/signup_controller.dart';
import 'package:permission_and_image_load/page/loading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(SignupController());
      }),
      debugShowCheckedModeBanner: false,
      home: const LoadingPage(),
    );
  }
}
