import 'package:get/get.dart';

class LocationController {
  RxBool seoulTapped = false.obs;
  RxBool gyeonggiTapped = false.obs;

  void tapSeoul() {
    seoulTapped.toggle();
  }

  void tapGyenggi() {
    gyeonggiTapped.toggle();
  }
}
