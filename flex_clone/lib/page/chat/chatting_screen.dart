import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/utils/color.dart';
import 'package:permission_and_image_load/utils/font_style.dart';

import '../../controller/signup_controller.dart';
import 'chat_body.dart';

class ChattingScreen extends GetView<SignupController> {
  const ChattingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Flex InterView',
          style: headLineStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              size: 30,
            ),
          ),
        ],
        elevation: 10,
      ),
      body: ChatBody(),
    );
  }
}
