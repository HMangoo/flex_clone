import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/page/chat/questions.dart';

import '../../../controller/signup_controller.dart';
import '../../../utils/app_layout.dart';
import '../../../utils/color.dart';
import '../../../utils/font_style.dart';

class YesOrNoMessage extends GetView<SignupController> {
  const YesOrNoMessage({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: message.lastQuestion
          ? const EdgeInsets.all(0.0)
          : EdgeInsets.only(left: AppLayout.getWidth(45)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (message.lastQuestion) ...[
            const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/emblem/pla4.png'),
            ),
            Gap(hDefaultPadding * 0.3)
          ],
          Container(
              margin: EdgeInsets.only(top: vDefaultPadding * 0.5),
              width: AppLayout.getWidth(250),
              padding: EdgeInsets.symmetric(
                  horizontal: hDefaultPadding * 0.5, vertical: vDefaultPadding),
              decoration: BoxDecoration(
                  color: message.isSender ? answerColor : baseColor1,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: questionStyle,
                  ),
                  Gap(AppLayout.getHeight(5)),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if (message.yesOrNoButton) {
                          controller.nextQuestion();
                        } else if (message.buttonMessage == '비흡연') {
                          controller.answer(message.buttonMessage);
                        } else {
                          message.firstButtonClickFunc();
                        }
                      },
                      child: Container(
                        width: AppLayout.getWidth(230),
                        padding: EdgeInsets.symmetric(
                            horizontal: hDefaultPadding * 0.5,
                            vertical: vDefaultPadding),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppLayout.getHeight(12)),
                          color:
                              message.yesOrNoButton ? baseColor4 : baseColor3,
                        ),
                        child: Center(
                            child: Text(
                          message.buttonMessage,
                          style: questionStyle,
                        )),
                      ),
                    ),
                  ),
                  Gap(AppLayout.getHeight(5)),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if (message.yesOrNoButton) {
                          controller.no();
                        }
                        if (message.isClickFunc &&
                            controller.questionIndex.value == 18) {
                          controller.answer('능력에 자신 있어요!');
                        }
                        if (message.buttonMessage2 == '흡연') {
                          controller.answer(message.buttonMessage2);
                        }
                      },
                      child: Container(
                        width: AppLayout.getWidth(230),
                        padding: EdgeInsets.symmetric(
                            horizontal: hDefaultPadding * 0.5,
                            vertical: vDefaultPadding),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppLayout.getHeight(12)),
                          color:
                              message.yesOrNoButton ? baseColor2 : baseColor3,
                        ),
                        child: Center(
                            child: Text(
                          message.buttonMessage2,
                          style: questionStyle,
                        )),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
