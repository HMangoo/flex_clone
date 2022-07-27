// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:permission_and_image_load/page/chat/permission/permission_description.dart';

import '../../../controller/signup_controller.dart';
import '../../../utils/app_layout.dart';
import '../../../utils/font_style.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionPage extends GetView<SignupController> {
  const PermissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: hDefaultPadding),
          child: Column(
            children: [
              Gap(AppLayout.getHeight(40)),
              Text('앱 사용을 위해 권한을 허용해주세요',
                  style: districtFont.copyWith(fontSize: 24)),
              Gap(AppLayout.getHeight(20)),
              Text(
                '플렉스 서비스 사용을 위해 꼭 필요한 권한만 요청드리고 있어요 :)',
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: AppLayout.getHeight(16)),
              ),
              Gap(AppLayout.getHeight(20)),
              const PermissionDescription(
                icon: Icons.notifications_on,
                permission: '알림',
                description:
                    '가입 승인 결과, 새로운 소개, 매칭, 라운지 활동, 데이트 초대 알림을 받을 수 있습니다',
              ),
              Gap(AppLayout.getHeight(20)),
              const PermissionDescription(
                icon: Icons.image,
                permission: '사진',
                description: '프로필 사진을 등록하고, 커뮤니티(라운지, 데이트)에서 이미지를 업로드할 수 있습니다',
              ),
              Gap(AppLayout.getHeight(20)),
              const PermissionDescription(
                icon: Icons.camera,
                permission: '카메라',
                description:
                    '노필터 사진 또는 동영상을 촬영하거나, 커뮤니터(라운지, 데이트)에서 직접 촬영한 이미지를 업로드할 수 있습니다',
              ),
              Gap(AppLayout.getHeight(40)),
              Container(
                height: AppLayout.getHeight(70),
                width: AppLayout.getSize(context).width,
                padding:
                    EdgeInsets.symmetric(horizontal: AppLayout.getWidth(12.0)),
                child: InkWell(
                  onTap: requestPermission,
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.circular(AppLayout.getHeight(10.0))),
                    child: Center(
                      child: Text(
                        '계속하기',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppLayout.getHeight(16.0),
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.notification,
      Permission.storage,
      Permission.camera
    ].request();

    statuses.forEach((permission, permissionStatus) async {
      if (!permissionStatus.isGranted) {
        openAppSettings();
        if (await permission.request().isGranted) {
          print('Permission was granted');
        }
      }
    });
    Get.back();
    if (controller.questionIndex.value != 18) {
      controller.nextQuestion();
    }
  }
}
