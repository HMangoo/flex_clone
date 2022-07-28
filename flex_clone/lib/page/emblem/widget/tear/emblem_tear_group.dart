import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:permission_and_image_load/page/emblem/widget/emblem_pick_controller.dart';
import 'package:permission_and_image_load/page/emblem/widget/tear/emblem_tear_element.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';

// ignore: must_be_immutable
class EmblemTearGroup extends StatelessWidget {
  EmblemTearGroup({Key? key, required this.capacity}) : super(key: key);

  Map<String, dynamic> capacity;
  EmblemPickController emblemPickController = EmblemPickController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: vDefaultPadding * 2.5),
      width: AppLayout.getSize(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(capacity['capacity']),
          Row(
            children: [
              EmblemSelectElement(
                  capacity: capacity,
                  index: 1,
                  emblemPickController: emblemPickController),
              Gap(AppLayout.getWidth(11)),
              EmblemSelectElement(
                  capacity: capacity,
                  index: 2,
                  emblemPickController: emblemPickController),
            ],
          ),
          Gap(AppLayout.getHeight(11)),
          Row(
            children: [
              EmblemSelectElement(
                  capacity: capacity,
                  index: 3,
                  emblemPickController: emblemPickController),
              Gap(AppLayout.getWidth(11)),
              if (capacity['num_tears'] == 4)
                EmblemSelectElement(
                    capacity: capacity,
                    index: 4,
                    emblemPickController: emblemPickController)
            ],
          ),
        ],
      ),
    );
  }
}
