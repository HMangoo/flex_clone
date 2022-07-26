// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:permission_and_image_load/page/chat/questions.dart';
// import 'package:permission_and_image_load/page/chat/widget/text_message.dart';

// import '../../utils/app_layout.dart';
// import 'widget/button_message.dart';

// class AllMessage extends StatelessWidget {
//   const AllMessage(
//       {Key? key, required this.message, required this.isSameSender})
//       : super(key: key);

//   final Message message;
//   final bool isSameSender;

//   @override
//   Widget build(BuildContext context) {
//     Widget messageContain(Message message) {
//       switch (message.messageType) {
//         case MessageType.text:
//           return TextMessage(message: message);
//         case MessageType.buttonMessage:
//           return ButtonMessage(message: message);
//         default:
//           return SizedBox();
//       }
//     }

//     return Row(
//       mainAxisAlignment:
//           message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
//       children: [
//         if (!message.isSender && !isSameSender) ...[
//           const CircleAvatar(
//             backgroundColor: Colors.white,
//             backgroundImage: AssetImage('assets/emblem/pla4.png'),
//           ),
//           Gap(hDefaultPadding * 0.3)
//         ],
//         Padding(
//           padding: (!message.isSender && isSameSender)
//               ? EdgeInsets.only(left: AppLayout.getWidth(45))
//               : const EdgeInsets.all(0.0),
//           child: messageContain(message),
//         ),
//       ],
//     );
//   }
// }
