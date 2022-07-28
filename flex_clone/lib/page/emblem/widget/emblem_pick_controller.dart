import 'package:get/get.dart';

class EmblemPickController {
  RxInt selectdEmblem = 0.obs;

  RxList duplicatedEmblem = [].obs;
  void firstClick(index) {
    duplicatedEmblem.add(index);
  }

  void secondClick(index) {
    duplicatedEmblem.remove(index);
  }
}
