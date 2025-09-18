import 'package:flutter/material.dart';
import 'package:tiktokfinalproject/constants/box.dart';
import 'package:tiktokfinalproject/constants/paddings.dart';
import 'package:tiktokfinalproject/constants/text.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final bool? isSubmit;

  const AuthButton({
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
          color: Color(0xfff3aaf2),
          border: Border.all(
            color: Colors.black,
            width: BoxConstants.borderNormal,
          ),
          borderRadius: BorderRadius.circular(
            BoxConstants.buttonBorderRadius,
          ),
          boxShadow: [
            BoxConstants.shadowRightBottom,
          ],
        ),
        child: Center(
          child: isSubmit == true
              ? CircularProgressIndicator.adaptive()
              : Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: TextConstants.normalSize,
                    fontWeight: TextConstants.normalWeight,
                  ),
                ),
        ),
      ),
    );
  }
}
