import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/page/chat/widget/text_message.dart';

import '../page/chat/questions.dart';

class SignupController {
  RxList<Widget> bubbles = <Widget>[].obs;

  List sendMessage = [1, 3, 5, 7, 9, 11];

  RxInt questionIndex = 0.obs;
  void nextQuestion() async {
    for (int i = 0; i < question[questionIndex.value].length; i++) {
      bubbles.add(question[questionIndex.value][i]);
      await Future.delayed(const Duration(milliseconds: 300));
      scrollDown();
    }
    if (sendMessage.contains(questionIndex.value)) {
      questionIndex.value++;
      nextQuestion();
    } else {
      questionIndex.value++;
    }
  }

  ScrollController scrollController = ScrollController();
  void scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 10),
        curve: Curves.fastOutSlowIn);
  }

  void answer(answer) {
    Message message = Message(text: answer, isSender: true);
    bubbles.add(TextMessage(message: message));
    nextQuestion();
  }

  void no() {
    questionIndex.value = questionIndex.value - 2;
    nextQuestion();
  }
}
