import 'package:flutter/material.dart';
import 'package:tiktokfinalproject/constants/sizes.dart';

class BoxConstants {
  // border
  static const borderThin = 1.5;
  static const borderNormal = 2.8;
  static const buttonHeight = 50.0;
  static final boxBorder = Border.all(
    color: Colors.black,
    width: borderNormal,
  );

  // size
  static const buttonBorderRadius = Sizes.size40;
  static const moodFormBorderRadius = Sizes.size12;
  static const moodBorderRadius = Sizes.size16;
  static const moodButtonSize = Sizes.size36;
  static const moodButtonBottom = Sizes.size4;
  static const moodButtonLeft = Sizes.size7;

  // shadow
  static const buttonShadowRightBottom = BoxShadow(
    color: Colors.black,
    offset: Offset(2, 2),
  );
  static const buttonShadowLeftBottom = BoxShadow(
    color: Colors.black,
    offset: Offset(2, 2),
  );
  static const boxShadowRightBottom = BoxShadow(
    color: Colors.black,
    offset: Offset(1, 3),
  );
  static const boxShadowLeftBottom = BoxShadow(
    color: Colors.black,
    offset: Offset(-1, 3),
  );
  static const shadowBottom = BoxShadow(
    color: Colors.black,
    offset: Offset(0, 3),
  );
}
