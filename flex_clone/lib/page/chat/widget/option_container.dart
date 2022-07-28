import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/controller/signup_controller.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/color.dart';

class OptionContainer extends GetView<SignupController> {
  const OptionContainer({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.questionIndex.value != 32) {
          controller.answer(text);
        } else {
          if (controller.selectedCharactor.contains(text)) {
            controller.cancel(text);
          } else {
            if (controller.selectedCharactor.length <= 2) {
              controller.select(text);
            }
          }
        }
      },
      child: Obx(
        () => Container(
          margin: EdgeInsets.only(top: vDefaultPadding * 0.5),
          width: AppLayout.getWidth(74),
          height: AppLayout.getHeight(30),
          padding: EdgeInsets.symmetric(
              vertical: AppLayout.getHeight(3),
              horizontal: AppLayout.getWidth(2)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppLayout.getHeight(5),
              ),
              color: controller.selectedCharactor.contains(text)
                  ? backgroundColor
                  : baseColor3),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
