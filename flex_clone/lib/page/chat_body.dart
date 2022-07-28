import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import '../../controller/signup_controller.dart';
import '../../controller/text_form_controller.dart';
import 'answer_field.dart';

// ignore: must_be_immutable
class ChatBody extends GetView<SignupController> {
  ChatBody({Key? key}) : super(key: key);

  TextFormController textFormController = TextFormController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: hDefaultPadding * 0.5),
              child: Obx(
                () => SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller.bubbles,
                  ),
                ),
              )),
        ),
        AnswerField(textFormController: textFormController),
      ],
    );
  }
}
