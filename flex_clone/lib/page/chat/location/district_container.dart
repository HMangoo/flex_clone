import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/controller/signup_controller.dart';
import 'package:permission_and_image_load/page/chat/location/location_list.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/font_style.dart';

class DistrictContainer extends GetView<SignupController> {
  const DistrictContainer({
    Key? key,
    required this.location,
  }) : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
        if (seoulList.contains(location)) {
          controller.answer('서울 $location');
        } else if (gyeonggiList.contains(location)) {
          controller.answer('경기 $location');
        } else {
          controller.answer(location);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(8)),
        height: AppLayout.getHeight(40),
        width: double.maxFinite,
        child: Text(
          location,
          style: headLineStyle.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}
