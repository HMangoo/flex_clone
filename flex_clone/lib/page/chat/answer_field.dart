import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/utils/color.dart';
import 'package:permission_and_image_load/utils/font_style.dart';

import '../../controller/signup_controller.dart';
import '../../controller/text_form_controller.dart';
import '../../utils/app_layout.dart';

class AnswerField extends GetView<SignupController> {
  const AnswerField({
    Key? key,
    required this.textFormController,
  }) : super(key: key);

  final TextFormController textFormController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: vDefaultPadding, horizontal: hDefaultPadding * 0.5),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textFormController.textEditingController,
              style: pageDescription,
              decoration: InputDecoration(
                filled: true,
                fillColor: baseColor1,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppLayout.getHeight(35)),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppLayout.getHeight(35)),
                  ),
                ),
                hintText: 'Type message',
                hintStyle: pageDescription,
                contentPadding: EdgeInsets.symmetric(
                    vertical: vDefaultPadding,
                    horizontal: hDefaultPadding * 0.5),
              ),
              onChanged: ((value) {
                textFormController.updataMessage(value);
              }),
            ),
          ),
          Gap(AppLayout.getWidth(8.0)),
          IconButton(
            onPressed: () {
              textFormController.sendMessage(context);
              if (controller.questionIndex.value == 13) {
                controller.answer(textFormController.userEnterMessage.value);
              } else {
                controller.nextQuestion();
              }
            },
            icon: Obx(
              () => Icon(
                Icons.send,
                color:
                    (textFormController.userEnterMessage.value.trim().isEmpty)
                        ? baseColor1
                        : baseColor4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
