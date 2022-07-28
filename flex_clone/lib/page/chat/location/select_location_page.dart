import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/controller/signup_controller.dart';
import 'package:permission_and_image_load/page/chat/location/city_selector.dart';
import 'package:permission_and_image_load/page/chat/location/district_container.dart';
import 'package:permission_and_image_load/page/chat/location/location_controller.dart';
import 'package:permission_and_image_load/page/chat/location/location_list.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/font_style.dart';

// ignore: must_be_immutable
class SelectLocation extends GetView<SignupController> {
  SelectLocation({Key? key}) : super(key: key);

  LocationController locationController = LocationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Gap(AppLayout.getHeight(20)),
            const Center(
              child: Text(
                '지역',
                style: headLineStyle,
              ),
            ),
            Gap(AppLayout.getHeight(30)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '지금 사는 곳은 어디신가요?',
                    style: headLineStyle.copyWith(fontSize: 28),
                  ),
                  Gap(AppLayout.getHeight(20)),
                  Text(
                    '지역',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  ),
                ],
              ),
            ),
            Gap(AppLayout.getHeight(20)),
            CitySelector(
                locationController: locationController, location: '서울'),
            Obx(() {
              if (locationController.seoulTapped.value) {
                return Column(
                  children: [
                    for (int i = 0; i < locationList.length; i++)
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(20)),
                        color: Colors.grey.shade200,
                        child: DistrictContainer(location: seoulList[i]),
                      ),
                  ],
                );
              } else {
                return Container();
              }
            }),
            CitySelector(
                locationController: locationController, location: '경기'),
            Obx(() {
              if (locationController.gyeonggiTapped.value) {
                return Column(
                  children: [
                    for (int i = 0; i < locationList.length; i++)
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(20)),
                        color: Colors.grey.shade200,
                        child: DistrictContainer(location: gyeonggiList[i]),
                      ),
                  ],
                );
              } else {
                return Container();
              }
            }),
            for (int i = 0; i < locationList.length; i++)
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppLayout.getWidth(12)),
                child: DistrictContainer(location: locationList[i]),
              ),
          ],
        ),
      ),
    );
  }
}
