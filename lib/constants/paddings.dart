import 'package:tiktokfinalproject/constants/sizes.dart';

class Paddings {
  // authentication
  static const authScreenHorizontal = Sizes.size60;
  static const authScreenVertical = Sizes.size60;
  static const authTextFormFieldHorizontal = Sizes.size10;
  static const authTextFormFieldVertical = Sizes.size10;
  static const authButtonHorizontal = Sizes.size10;
  static const authButtonVertical = Sizes.size7;
  static const bottomAppBarHorizontal = Sizes.size48;
  static const bottomAppBarBottom = Sizes.size16;
  static const bottomAppBarTop = Sizes.size18;

  // mood screens
  static const moodScreenHorizontal = Sizes.size32;
  static const moodTextFormFieldHorizontal = Sizes.size10;
  static const moodTextFormFieldVertical = Sizes.size6;
  static const moodSubmitButtonHorizontal =
      authScreenHorizontal - moodScreenHorizontal;
}
