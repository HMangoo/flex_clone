import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/page/chat/widget/text_message.dart';

import '../page/chat/questions.dart';

class SignupController {
  RxList<Widget> bubbles = <Widget>[].obs;

  List sendMessage = [1, 3, 5, 7, 9, 11, 14, 19, 24, 37];

  List wantAnswerNum = [13, 16, 18];

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

  RxString answerStorage = ''.obs;

  void answer(answer) {
    answerStorage.value = answer;
    Message message = Message(text: answer, isSender: true);
    bubbles.add(TextMessage(message: message));
    nextQuestion();
  }

  void repeatPW(answer) {
    Message message = Message(text: answer, isSender: true);
    bubbles.add(TextMessage(message: message));
    scrollDown();
  }

  void no() {
    questionIndex.value = questionIndex.value - 2;
    nextQuestion();
  }

  void incorrectPW() {
    Message message = Message(
      text: '비밀번호가 일치하지 않아요. 처음부터 다시 입력해주세요',
      isSender: false,
      lastQuestion: true,
    );
    bubbles.add(TextMessage(message: message));
    questionIndex.value = questionIndex.value - 1;
    scrollDown();
  }

  void rejectName() {
    Message message = Message(
      text: '다른 멤버가 사용 중인 닉네임이에요. 다른 닉네임을 입력해주세요',
      isSender: false,
      lastQuestion: true,
    );
    bubbles.add(TextMessage(message: message));
    scrollDown();
  }

  RxInt singleEmblemClickCount = 0.obs;
  RxInt duplicatedEmblemClickCount = 0.obs;

  RxString selectedLocation = ''.obs;

  RxList selectedCharactor = [].obs;
  void select(String text) {
    selectedCharactor.add(text);
  }

  void cancel(String text) {
    selectedCharactor.remove(text);
  }
}
