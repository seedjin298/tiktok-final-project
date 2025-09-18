import 'package:flutter/material.dart';
import 'package:tiktokfinalproject/constants/sizes.dart';

class BoxConstants {
  static const buttonBorderRadius = Sizes.size40;
  static const borderThin = 1.5;
  static const borderNormal = 2.8;
  static const buttonHeight = 50.0;
  static const shadowRightBottom = BoxShadow(
    color: Colors.black,
    offset: Offset(2, 2),
  );
  static const shadowLeftBottom = BoxShadow(
    color: Colors.black,
    offset: Offset(-2, 2),
  );
}
