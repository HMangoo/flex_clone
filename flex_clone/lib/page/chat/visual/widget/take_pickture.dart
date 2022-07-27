import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_and_image_load/utils/app_layout.dart';
import 'package:permission_and_image_load/utils/color.dart';

class TakePicture extends StatefulWidget {
  TakePicture({Key? key, required this.size, this.minor = false})
      : super(key: key);

  double size;
  bool minor;

  @override
  State<TakePicture> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  File? pickedImage;

  Future pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImageFile =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImageFile == null) return;
    setState(() {
      pickedImage = File(pickedImageFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickImage,
      child: Container(
        width: AppLayout.getWidth(widget.size),
        height: AppLayout.getHeight(widget.size),
        decoration: BoxDecoration(
          border: Border.all(color: widget.minor ? baseColor4 : baseColor3),
        ),
        child: pickedImage != null
            ? Image(
                image: FileImage(pickedImage!),
                fit: BoxFit.fill,
              )
            : const Center(
                child: Icon(
                  Icons.add,
                  color: baseColor4,
                  size: 30,
                ),
              ),
      ),
    );
  }
}
