import 'package:flutter/material.dart';
import 'package:tiktokfinalproject/constants/box.dart';
import 'package:tiktokfinalproject/constants/sizes.dart';
import 'package:tiktokfinalproject/constants/text.dart';

class MoodButton extends StatelessWidget {
  final String mood;
  final bool isChosen;

  const MoodButton({
    super.key,
    required this.mood,
    required this.isChosen,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: BoxConstants.moodButtonSize,
      width: BoxConstants.moodButtonSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isChosen ? Theme.of(context).primaryColor : Colors.white,
        border: Border.all(
          color: Colors.black,
          width: BoxConstants.borderThin,
        ),
        borderRadius: BorderRadius.circular(
          Sizes.size5,
        ),
        boxShadow: [
          BoxConstants.shadowBottom,
        ],
      ),
      duration: Duration(milliseconds: 80),
      child: Stack(
        children: [
          Positioned(
            bottom: BoxConstants.moodButtonBottom,
            left: BoxConstants.moodButtonLeft,
            child: Text(
              mood,
              style: TextStyle(
                fontSize: TextConstants.middleSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
