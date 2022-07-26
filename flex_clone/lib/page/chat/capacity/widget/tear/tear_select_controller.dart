import 'package:get/get.dart';

class TearSelectController {
  RxInt selectdTear = 1.obs;

  void tearSelection(int value) {
    selectdTear(value);
  }
}
