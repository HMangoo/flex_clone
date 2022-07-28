import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/page/chat/chatting_screen.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/color.dart';
import 'package:permission_and_image_load/utils/font_style.dart';

import 'controller/signup_controller.dart';

class LoadingPage extends GetView<SignupController> {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: InkWell(
            onTap: () {
              Get.to(() => const ChattingScreen());
              controller.nextQuestion();
            },
            child: Container(
              width: AppLayout.getSize(context).width * 0.5,
              height: AppLayout.getHeight(100),
              decoration: BoxDecoration(
                  color: baseColor3,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(20))),
              child: const Center(
                child: Text(
                  '회원가입 시작',
                  style: pageDescription,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
