import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:permission_and_image_load/page/chat/capacity/capacity_list.dart';
import 'package:permission_and_image_load/page/chat/capacity/widget/env/spec_container.dart';
import 'package:permission_and_image_load/utils/font_style.dart';

import '../../../utils/app_layout.dart';
import '../../../widget/ok_button.dart';
import '../../../widget/page_title_appbar.dart';
import 'widget/tear/tear_container.dart';

class CapacityPage extends StatelessWidget {
  const CapacityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: pageTitle('가입자격'),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: hDefaultPadding),
            children: [
              const Text(
                '가입자격을 확인해주세요',
                style: headLineStyle,
              ),
              Gap(AppLayout.getHeight(20)),
              const Text(
                  '외모, 소비, 소득, 자산, 커리어 등 다양한 매력을 상징하는 22개 엠블럼 중 하나 이상을 획득하셔야 플렉스를 이용할 수 있어요',
                  style: pageDescription),
              Gap(AppLayout.getHeight(20)),
              Column(
                children: capacityList
                    .map((singleCapacity) =>
                        TearContainer(capacity: singleCapacity))
                    .toList(),
              ),
              Column(
                children: specList
                    .map((singleSpec) => SpecContainer(capacity: singleSpec))
                    .toList(),
              ),
              Gap(AppLayout.getHeight(80)),
            ],
          ),
          Positioned(
            bottom: 0,
            child: OkButton(
              buttonText: '다 확인했어요!',
            ),
          ),
        ],
      ),
    );
  }
}
