import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/controller/signup_controller.dart';
import 'package:permission_and_image_load/loading_page.dart';
import 'package:permission_and_image_load/page/chat/capacity/capacity_page.dart';
import 'package:permission_and_image_load/page/chat/emblem/emblem_select_page.dart';
import 'package:permission_and_image_load/page/chat/permission/permission_page.dart';
import 'package:permission_and_image_load/page/chat/visual/visual_page.dart';
import 'page/chat/chatting_screen.dart';

void main() {
  runApp(MyApp());
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
      home: LoadingPage(),
    );
  }
}
