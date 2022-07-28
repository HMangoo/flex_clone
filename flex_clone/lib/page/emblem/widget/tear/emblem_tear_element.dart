import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/controller/signup_controller.dart';
import 'package:permission_and_image_load/page/emblem/widget/emblem_pick_controller.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/color.dart';
import 'package:permission_and_image_load/utils/font_style.dart';
import 'dart:math' as math;

// ignore: must_be_immutable
class EmblemSelectElement extends GetView<SignupController> {
  EmblemSelectElement({
    Key? key,
    required this.capacity,
    required this.index,
    required this.emblemPickController,
  }) : super(key: key);

  Map<String, dynamic> capacity;
  int index;
  EmblemPickController emblemPickController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          if (emblemPickController.selectdEmblem.value == index) {
            emblemPickController.selectdEmblem.value = 0;
            controller.singleEmblemClickCount.value = 0;
          } else {
            emblemPickController.selectdEmblem.value = index;
            controller.singleEmblemClickCount.value++;
          }
        },
        child: (emblemPickController.selectdEmblem.value != index)
            ? Container(
                padding: EdgeInsets.symmetric(
                    horizontal: hDefaultPadding / 2,
                    vertical: vDefaultPadding / 2),
                width: AppLayout.getWidth(180),
                height: AppLayout.getHeight(180),
                color: Colors.grey.shade100,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(AppLayout.getHeight(vDefaultPadding)),
                        Text(
                          capacity['capacity_en'] +
                              ' ' +
                              capacity['tear']['tear${index.toString()}']['id'],
                          style: capacityFont.copyWith(fontSize: 20),
                        ),
                        Text(
                          '${capacity['qualification']} ${capacity['tear']['tear${index.toString()}']['score'].toString()} +',
                          style: emblemFont.copyWith(color: baseColor3),
                        ),
                      ],
                    ),
                    if (capacity['tear']['tear${index.toString()}']['blind'] ==
                        true)
                      Positioned(
                        bottom: AppLayout.getHeight(35),
                        right: AppLayout.getWidth(5),
                        child: Transform.rotate(
                          angle: 340 * math.pi / 180, // 45 부분이 원하는 각도
                          child: const Text(
                            "BLIND",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                        width: AppLayout.getWidth(70),
                        height: AppLayout.getHeight(70),
                        child: Image(
                          image: AssetImage(capacity['tear']
                              ['tear${index.toString()}']['badge']),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: hDefaultPadding / 2,
                        vertical: vDefaultPadding / 2),
                    width: AppLayout.getWidth(180),
                    height: AppLayout.getHeight(180),
                    color: Colors.grey.shade100,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(AppLayout.getHeight(vDefaultPadding)),
                            Text(
                              capacity['capacity_en'] +
                                  ' ' +
                                  capacity['tear']['tear${index.toString()}']
                                      ['id'],
                              style: capacityFont.copyWith(fontSize: 20),
                            ),
                            Text(
                              '${capacity['qualification']} ${capacity['tear']['tear${index.toString()}']['score'].toString()} +',
                              style: emblemFont.copyWith(color: baseColor3),
                            ),
                          ],
                        ),
                        if (capacity['tear']['tear${index.toString()}']
                                ['blind'] ==
                            true)
                          Positioned(
                            bottom: AppLayout.getHeight(35),
                            right: AppLayout.getWidth(5),
                            child: Transform.rotate(
                              angle: 340 * math.pi / 180, // 45 부분이 원하는 각도
                              child: const Text(
                                "BLIND",
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: SizedBox(
                            width: AppLayout.getWidth(70),
                            height: AppLayout.getHeight(70),
                            child: Image(
                              image: AssetImage(capacity['tear']
                                  ['tear${index.toString()}']['badge']),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: AppLayout.getWidth(180),
                    height: AppLayout.getHeight(180),
                    color: Colors.black54,
                    child: Center(
                      child: Container(
                        width: AppLayout.getWidth(100),
                        height: AppLayout.getHeight(100),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Center(
                          child: Text(
                            'APPLY',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
