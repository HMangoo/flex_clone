import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:permission_and_image_load/page/chat/visual/widget/take_pickture.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/color.dart';
import 'package:permission_and_image_load/utils/font_style.dart';
import 'package:permission_and_image_load/widget/ok_button.dart';

import '../../../widget/page_title_appbar.dart';

class VisualPage extends StatelessWidget {
  const VisualPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: pageTitle('사진'),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: vDefaultPadding, horizontal: hDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(hDefaultPadding * 0.5),
            const Text('어떤 사진으로 어필해요볼까요?', style: headLineStyle),
            Gap(hDefaultPadding * 1.5),
            Text(
              '프로필 사진',
              style: pageDescription.copyWith(
                  color: baseColor3, fontWeight: FontWeight.w600, fontSize: 14),
            ),
            Gap(hDefaultPadding * 0.5),
            Row(
              children: [
                TakePicture(size: 244),
                Gap(AppLayout.getWidth(10)),
                Column(
                  children: [
                    TakePicture(size: 117),
                    Gap(AppLayout.getHeight(10)),
                    TakePicture(size: 117),
                  ],
                )
              ],
            ),
            Gap(AppLayout.getHeight(10)),
            Row(
              children: [
                TakePicture(size: 117, minor: true),
                Gap(AppLayout.getWidth(10)),
                TakePicture(size: 117, minor: true),
                Gap(AppLayout.getWidth(10)),
                TakePicture(size: 117, minor: true),
              ],
            ),
            Spacer(),
            OkButton(buttonText: '계속')
          ],
        ),
      ),
    );
  }
}
