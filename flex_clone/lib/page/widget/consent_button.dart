import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:permission_and_image_load/utils/color.dart';
import 'package:permission_and_image_load/utils/font_style.dart';

import '../../../utils/app_layout.dart';

class ConsentButton extends StatefulWidget {
  const ConsentButton({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ConsentButton> createState() => _ConsentButtonState();
}

class _ConsentButtonState extends State<ConsentButton> {
  bool _tapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_tapped == false) {
            _tapped = true;
          } else {
            _tapped = false;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(5)),
        margin: EdgeInsets.only(bottom: AppLayout.getHeight(5)),
        width: AppLayout.getWidth(250),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppLayout.getHeight(12)),
            color: baseColor2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Gap(AppLayout.getWidth(3.0)),
                Icon(Icons.check_circle_outline,
                    color: _tapped ? Colors.green : baseColor3),
                Gap(AppLayout.getWidth(4.0)),
                Text(
                  widget.title,
                  style: _tapped
                      ? questionStyle.copyWith(color: Colors.green)
                      : questionStyle.copyWith(color: baseColor3),
                ),
              ],
            ),
            Icon(Icons.keyboard_arrow_right,
                color: _tapped ? Colors.green : baseColor3)
          ],
        ),
      ),
    );
  }
}
