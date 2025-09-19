import 'package:flutter/material.dart';
import 'package:tiktokfinalproject/constants/box.dart';
import 'package:tiktokfinalproject/constants/paddings.dart';
import 'package:tiktokfinalproject/constants/text.dart';

class SubmitButton extends StatelessWidget {
  final String buttonText;
  final bool? isSubmit;

  const SubmitButton({
    super.key,
    required this.buttonText,
    this.isSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Container(
        height: BoxConstants.buttonHeight,
        padding: EdgeInsets.symmetric(
          vertical: Paddings.authButtonVertical,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: BoxConstants.boxBorder,
          borderRadius: BorderRadius.circular(
            BoxConstants.buttonBorderRadius,
          ),
          boxShadow: [
            BoxConstants.buttonShadowRightBottom,
          ],
        ),
        child: Center(
          child: isSubmit == true
              ? CircularProgressIndicator.adaptive()
              : Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: TextConstants.middleSize,
                    fontWeight: TextConstants.middleWeight,
                  ),
                ),
        ),
      ),
    );
  }
}
