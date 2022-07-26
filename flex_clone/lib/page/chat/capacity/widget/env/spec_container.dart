import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/page/chat/capacity/widget/env/spec_controller.dart';
import 'package:permission_and_image_load/page/chat/capacity/widget/env/spec_select_container.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/font_style.dart';

// ignore: must_be_immutable
class SpecContainer extends StatelessWidget {
  SpecContainer({Key? key, required this.capacity}) : super(key: key);

  final Map<String, dynamic> capacity;
  SpecSelectController specSelectContainer = SpecSelectController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppLayout.getHeight(10)),
      height: AppLayout.getHeight(180),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                capacity['capacity'],
              ),
            ],
          ),
          Gap(AppLayout.getHeight(10)),
          Obx(
            () => Row(
              children: [
                Image(
                  image: AssetImage(capacity['spec']
                          ['spec${specSelectContainer.selectdSpec.value}']
                      ['badge']),
                  width: AppLayout.getWidth(50),
                  height: AppLayout.getHeight(50),
                  fit: BoxFit.cover,
                ),
                Gap(AppLayout.getWidth(10)),
                Text(
                  capacity['spec']
                      ['spec${specSelectContainer.selectdSpec.value}']['id'],
                  style: capacityFont,
                ),
                if (capacity['spec']
                            ['spec${specSelectContainer.selectdSpec.value}']
                        ['blind'] !=
                    null)
                  Container(
                    height: AppLayout.getHeight(20),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getHeight(8),
                        vertical: AppLayout.getWidth(5)),
                    margin: EdgeInsets.only(left: AppLayout.getWidth(5)),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppLayout.getHeight(10)),
                        color: const Color.fromARGB(255, 8, 71, 10)),
                    child: const Text(
                      'Blind',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Gap(AppLayout.getWidth(60)),
                    Obx(
                      () => Container(
                        constraints:
                            BoxConstraints(maxWidth: AppLayout.getWidth(310)),
                        child: Text(
                          capacity['spec'][
                                  'spec${specSelectContainer.selectdSpec.value}']
                              ['description'],
                          style: TextStyle(
                              fontSize: AppLayout.getHeight(12),
                              color: Colors.grey.shade500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Gap(AppLayout.getHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (int i = 0; i < capacity['num_options']; i++)
                SpecSelectContainer(
                  spec: capacity['spec']['spec${i + 1}'],
                  controller: specSelectContainer,
                  numOption: capacity['num_options'],
                )
            ],
          ),
          Gap(AppLayout.getHeight(10))
        ],
      ),
    );
  }
}
