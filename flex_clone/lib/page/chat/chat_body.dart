import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/page/chat/questions.dart';
import 'package:permission_and_image_load/page/chat/widget/text_message.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/color.dart';
import 'package:permission_and_image_load/utils/font_style.dart';
import '../../controller/signup_controller.dart';
import '../../controller/text_form_controller.dart';
import 'all_message.dart';
import 'answer_field.dart';

// class ChatBody extends StatelessWidget {
//   ChatBody({Key? key}) : super(key: key);

//   TextFormController textFormController = TextFormController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: hDefaultPadding * 0.5),
//             child: ListView.builder(
//               itemCount: demeChatMessages.length,
//               itemBuilder: ((context, index) {
//                 final Message message = demeChatMessages[index];
//                 final Message? prevMessage;
//                 bool isSameSender = false;
//                 if (index > 0) {
//                   prevMessage = demeChatMessages[index - 1];
//                   isSameSender = message.isSender == prevMessage!.isSender;
//                 }
//                 return AllMessage(
//                     message: demeChatMessages[index],
//                     isSameSender: isSameSender);
//               }),
//             ),
//           ),
//         ),
//         AnswerField(textFormController: textFormController),
//       ],
//     );
//   }
// }

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
