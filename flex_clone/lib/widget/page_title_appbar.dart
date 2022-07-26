import 'package:flutter/material.dart';

import '../utils/font_style.dart';

AppBar pageTitle(String title) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: headLineStyle.copyWith(fontSize: 20),
    ),
    centerTitle: true,
    elevation: 0.0,
  );
}
