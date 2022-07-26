import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/page/chat/capacity/widget/tear/tear_select_controller.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/font_style.dart';
import 'tear_select_container.dart';

// ignore: must_be_immutable
class TearContainer extends StatelessWidget {
  TearContainer({Key? key, required this.capacity}) : super(key: key);

  final Map<String, dynamic> capacity;
  TearSelectController csController = TearSelectController();

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
                  image: AssetImage(capacity['tear']
                      ['tear${csController.selectdTear.value}']['badge']),
                  width: AppLayout.getWidth(50),
                  height: AppLayout.getHeight(50),
                  fit: BoxFit.cover,
                ),
                Gap(AppLayout.getWidth(10)),
                Text(
                  capacity['capacity_en'],
                  style: capacityFont,
                ),
                if (capacity['tear']['tear${csController.selectdTear.value}']
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
                          '${capacity['qualification']} ${capacity['tear']['tear${csController.selectdTear.value}']['score']} +',
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
              for (int i = 0; i < capacity['num_tears']; i++)
                CapacitySelectContainer(
                  tear: capacity['tear']['tear${i + 1}'],
                  controller: csController,
                  numOption: capacity['num_tears'],
                )
            ],
          ),
          Gap(AppLayout.getHeight(10))
        ],
      ),
    );
  }
}
