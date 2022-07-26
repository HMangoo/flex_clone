import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/page/chat/capacity/widget/env/spec_controller.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/font_style.dart';

// ignore: must_be_immutable
class SpecSelectContainer extends StatelessWidget {
  SpecSelectContainer(
      {Key? key,
      required this.spec,
      required this.controller,
      required this.numOption})
      : super(key: key);

  final Map<String, dynamic> spec;
  SpecSelectController controller;
  final int numOption;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          controller.selectdSpec.value = spec['id_num'];
          controller.specSelection(spec['id_num']);
        },
        child: Container(
          margin: EdgeInsets.only(left: AppLayout.getWidth(5)),
          height: AppLayout.getHeight(30),
          padding: EdgeInsets.symmetric(
              vertical: AppLayout.getHeight(5),
              horizontal: AppLayout.getWidth(8)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
              color: (controller.selectdSpec.value == spec['id_num'])
                  ? Colors.white70
                  : Colors.grey.shade400),
          child: Center(
            child: Row(
              children: [
                Image(
                  image: AssetImage(spec['badge']),
                  height: ((numOption == 3) ||
                          (numOption == 4 &&
                              controller.selectdSpec.value == spec['id_num']))
                      ? AppLayout.getHeight(20)
                      : AppLayout.getHeight(10),
                  fit: BoxFit.fitWidth,
                ),
                Gap(AppLayout.getWidth(3.0)),
                Text(
                  spec['id'],
                  style: capacityFont.copyWith(
                      fontSize: 15,
                      color: (controller.selectdSpec.value == spec['id_num'])
                          ? Colors.black87
                          : Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
