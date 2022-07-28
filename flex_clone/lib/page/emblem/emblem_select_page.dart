import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/controller/signup_controller.dart';
import 'package:permission_and_image_load/page/emblem/widget/spec/emblem_spec_group.dart';
import 'package:permission_and_image_load/page/emblem/widget/tear/emblem_tear_group.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/color.dart';
import 'package:permission_and_image_load/utils/font_style.dart';
import 'package:permission_and_image_load/widget/page_title_appbar.dart';

import '../../utils/capacity_list.dart';

class EmblemSelectPage extends GetView<SignupController> {
  const EmblemSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageTitle('엠블럼'),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hDefaultPadding),
            child: ListView(
              children: [
                Gap(vDefaultPadding),
                const Text('당신의 매력을 뽐내주세요', style: headLineStyle),
                Gap(vDefaultPadding * 2),
                const Text(
                  '당신의 매력을 어필할 수 있는 엠블럼을 하나 이상 선택해서 인증 서류를 첨부해주세요',
                  style: pageDescription,
                ),
                Column(
                    children: capacityList.map(
                  ((singleTear) {
                    if (singleTear['capacity'] == '외모') {
                      return Container();
                    } else {
                      return EmblemTearGroup(capacity: singleTear);
                    }
                  }),
                ).toList()),
                Column(
                    children: specList
                        .map(
                          ((singleTear) =>
                              EmblemSpecGroup(capacity: singleTear)),
                        )
                        .toList()),
                Gap(AppLayout.getHeight(70))
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
                height: AppLayout.getHeight(80),
                width: AppLayout.getSize(context).width,
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    vertical: vDefaultPadding, horizontal: hDefaultPadding),
                child: Obx(
                  () => ElevatedButton(
                    onPressed: (controller.singleEmblemClickCount.value +
                                controller.duplicatedEmblemClickCount.value ==
                            0)
                        ? null
                        : () {
                            Get.back();
                            controller.nextQuestion();
                          },
                    style: ElevatedButton.styleFrom(primary: backgroundColor),
                    child: Text(
                      '완료',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppLayout.getHeight(16.0),
                          color: Colors.white),
                    ),
                  ),
                )),
          )
          // controller.emblemClickCount.value;
        ],
      ),
    );
  }
}
