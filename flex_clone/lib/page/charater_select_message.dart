import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/controller/signup_controller.dart';
import 'package:permission_and_image_load/page/chat/questions.dart';
import 'package:permission_and_image_load/page/chat/widget/option_container.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/color.dart';
import 'package:permission_and_image_load/utils/font_style.dart';

class CharaterSelectMessage extends GetView<SignupController> {
  const CharaterSelectMessage({Key? key, required this.message})
      : super(key: key);

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
                  Row(
                    children: [
                      for (int i = 0; i < message.row3.length; i++) ...[
                        OptionContainer(text: message.row3[i]),
                        if (i != 2) Gap(AppLayout.getWidth(4))
                      ]
                    ],
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < message.row4.length; i++) ...[
                        OptionContainer(text: message.row4[i]),
                        if (i != 2) Gap(AppLayout.getWidth(4))
                      ]
                    ],
                  ),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        if (controller.selectedCharactor.length == 3) {
                          controller.answer(
                              '${controller.selectedCharactor.value[0]}, ${controller.selectedCharactor.value[1]}, ${controller.selectedCharactor.value[2]}');
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: AppLayout.getHeight(8)),
                        width: AppLayout.getWidth(230),
                        padding: EdgeInsets.symmetric(
                            horizontal: hDefaultPadding * 0.5,
                            vertical: vDefaultPadding),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppLayout.getHeight(12)),
                          color: (controller.selectedCharactor.length == 3)
                              ? baseColor3
                              : backgroundColor,
                        ),
                        child: Center(
                          child: Text(
                            '완료',
                            style: (controller.selectedCharactor.length == 3)
                                ? questionStyle
                                : questionStyle.copyWith(color: baseColor1),
                          ),
                        ),
                      ),
                    ),
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

// class OptionSelectFinish extends StatelessWidget {
//   const OptionSelectFinish({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   final SignupController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => GestureDetector(
//         onTap: () {
//           if (controller.selectedCharactor.length == 3) {
//             controller.answer(
//                 '${controller.selectedCharactor[0]}, ${controller.selectedCharactor[1]}, ${controller.selectedCharactor[2]}');
//           }
//         },
//         child: Container(
//           margin: EdgeInsets.only(top: AppLayout.getHeight(5)),
//           width: AppLayout.getWidth(230),
//           padding: EdgeInsets.symmetric(
//               horizontal: hDefaultPadding * 0.5, vertical: vDefaultPadding),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(AppLayout.getHeight(12)),
//             color: baseColor3,
//           ),
//           child: const Center(
//               child: Text(
//             '완료',
//             style: questionStyle,
//           )),
//         ),
//       ),
//     );
//   }
// }
