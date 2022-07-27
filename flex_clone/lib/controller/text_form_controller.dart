import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TextFormController {
  var userEnterMessage = ''.obs;
  final textEditingController = TextEditingController();

  RxString tempPW = ''.obs;

  void sendMessage(context) {
    FocusScope.of(context).unfocus();
    textEditingController.clear();
  }

  void updataMessage(value) {
    userEnterMessage(value);
  }

  void storeTempPW() {
    tempPW.value = userEnterMessage.value;
  }

  void initailizePW() {
    tempPW.value = '';
  }

  void itIsPassword() {
    int length = userEnterMessage.value.length;
    String toPassword = ''.padRight(length, '*');
    userEnterMessage.value = toPassword;
  }
}
