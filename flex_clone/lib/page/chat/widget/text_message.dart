import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../controller/signup_controller.dart';
import '../../../utils/app_layout.dart';
import '../../../utils/color.dart';
import '../../../utils/font_style.dart';
import '../questions.dart';

class TextMessage extends GetView<SignupController> {
  const TextMessage({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: message.lastQuestion
          ? const EdgeInsets.all(0.0)
          : EdgeInsets.only(left: AppLayout.getWidth(45)),
      child: Row(
        children: [
          if (message.lastQuestion) ...[
            const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/emblem/pla4.png'),
            ),
            Gap(hDefaultPadding * 0.3)
          ],
          if (message.isSender) Spacer(),
          Container(
              margin: EdgeInsets.only(top: vDefaultPadding * 0.5),
              constraints: BoxConstraints(maxWidth: AppLayout.getWidth(250)),
              padding: EdgeInsets.symmetric(
                  horizontal: hDefaultPadding * 0.5, vertical: vDefaultPadding),
              decoration: BoxDecoration(
                  color: message.isSender ? answerColor : baseColor1,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(10))),
              child: Text(
                (!message.isUseAnswer)
                    ? message.text
                    : '${message.text} ${controller.answerStorage.value}',
                style: questionStyle,
              )),
        ],
      ),
    );
  }
}
