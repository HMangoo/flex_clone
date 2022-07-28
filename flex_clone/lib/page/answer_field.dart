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
              }
              if (controller.questionIndex.value == 16) {
                textFormController.storeTempPW();
                textFormController.itIsPassword();
                controller.answer(textFormController.userEnterMessage.value);
              }
              // 18(비밀먼호 확인차례) 입력한것과 임시저장한 비밀번호가 일치하지 않는다면
              // 비밀번호가 맞지 않는다, 다시입력해달라는 채팅을 띄워주고 입력을 기다린다.
              // 비밀번호가 맞는다면 저장된 다음 메세지를 띄운다.
              if (controller.questionIndex.value == 17) {
                if (textFormController.userEnterMessage.value !=
                    textFormController.tempPW.value) {
                  textFormController.itIsPassword();
                  controller
                      .repeatPW(textFormController.userEnterMessage.value);
                  textFormController.initailizePW();
                  controller.incorrectPW();
                } else {
                  textFormController.itIsPassword();
                  controller.answer(textFormController.userEnterMessage.value);
                }
              }
              if (controller.questionIndex.value == 21) {
                if (textFormController.duplicatedName.value ==
                    textFormController.userEnterMessage.value) {
                  controller
                      .repeatPW(textFormController.userEnterMessage.value);
                  controller.rejectName();
                } else {
                  controller.answer(textFormController.userEnterMessage.value);
                }
              }
              // 어떤일을 하시나요 부터 하면됨!!!!!!!!!!!!!!!!!!!!!!!
              if (controller.questionIndex.value == 23) {
                controller.answer(textFormController.userEnterMessage.value);
              }
              if (controller.questionIndex.value == 27) {
                controller.answer(textFormController.userEnterMessage.value);
              }
              if (controller.questionIndex.value == 33) {
                controller.answer(textFormController.userEnterMessage.value);
              }
              if (controller.questionIndex.value == 34) {
                controller.answer(textFormController.userEnterMessage.value);
              }
              if (controller.questionIndex.value == 35) {
                controller.answer(textFormController.userEnterMessage.value);
              }
              if (controller.questionIndex.value == 36) {
                controller.answer(textFormController.userEnterMessage.value);
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
