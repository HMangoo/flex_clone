import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/signup_controller.dart';
import '../utils/app_layout.dart';

// ignore: must_be_immutable
class OkButton extends GetView<SignupController> {
  OkButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppLayout.getHeight(80),
        width: AppLayout.getSize(context).width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            vertical: vDefaultPadding, horizontal: hDefaultPadding),
        child: InkWell(
          onTap: () {
            Get.back();
            if (controller.questionIndex.value != 18) {
              controller.nextQuestion();
            }
          },
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(AppLayout.getHeight(10.0))),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppLayout.getHeight(16.0),
                    color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
