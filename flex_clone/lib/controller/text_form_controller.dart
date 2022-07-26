import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TextFormController {
  var userEnterMessage = ''.obs;
  final textEditingController = TextEditingController();

  void sendMessage(context) {
    FocusScope.of(context).unfocus();
    textEditingController.clear();
  }

  void updataMessage(value) {
    userEnterMessage(value);
  }
}
