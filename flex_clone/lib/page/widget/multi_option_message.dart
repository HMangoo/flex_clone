import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/controller/signup_controller.dart';

import 'package:permission_and_image_load/page/widget/option_container.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/color.dart';
import 'package:permission_and_image_load/utils/font_style.dart';

import '../questions.dart';

class MultiOptionMessge extends GetView<SignupController> {
  const MultiOptionMessge({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: message.lastQuestion
          ? const EdgeInsets.all(0.0)
          : EdgeInsets.only(left: AppLayout.getWidth(45)),
      child: Center(
        child: Row(
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
              constraints: BoxConstraints(maxWidth: AppLayout.getWidth(250)),
              padding: EdgeInsets.symmetric(
                  horizontal: hDefaultPadding * 0.5, vertical: vDefaultPadding),
              decoration: BoxDecoration(
                  color: baseColor1,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: questionStyle,
                  ),
                  Gap(vDefaultPadding * 0.5),
                  Row(
                    children: [
                      for (int i = 0; i < message.row1.length; i++) ...[
                        OptionContainer(text: message.row1[i]),
                        if (i != 2) Gap(AppLayout.getWidth(4))
                      ],
                    ],
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < message.row2.length; i++) ...[
                        OptionContainer(text: message.row2[i]),
                        if (i != 2) Gap(AppLayout.getWidth(4))
                      ]
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
