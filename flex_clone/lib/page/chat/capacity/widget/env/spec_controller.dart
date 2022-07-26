import 'package:get/get.dart';

class SpecSelectController {
  RxInt selectdSpec = 1.obs;

  void specSelection(int value) {
    selectdSpec(value);
  }
}
