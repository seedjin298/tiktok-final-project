import 'package:flutter/material.dart';
import 'package:tiktokfinalproject/constants/box.dart';
import 'package:tiktokfinalproject/constants/color.dart';
import 'package:tiktokfinalproject/constants/gaps.dart';
import 'package:tiktokfinalproject/constants/paddings.dart';
import 'package:tiktokfinalproject/constants/text.dart';
import 'package:tiktokfinalproject/features/mood/models.dart/mood_model.dart';

class Mood extends StatelessWidget {
  final MoodModel moodData;

  const Mood({
    super.key,
    required this.moodData,
  });

  String _getWhenText(int isWhen) {
    if (isWhen >= 1000 * 60 * 60 * 24) {
      final value = isWhen ~/ (1000 * 60 * 60 * 24);
      if (value == 1) {
        return "1 day ago";
      }
      return "$value days ago";
    } else if (isWhen >= 1000 * 60 * 60) {
      final value = isWhen ~/ (1000 * 60 * 60);
      if (value == 1) {
        return "1 hour ago";
      }
      return "$value hours ago";
    } else if (isWhen >= 1000 * 60) {
      final value = isWhen ~/ (1000 * 60);
      if (value == 1) {
        return "1 minute ago";
      }
      return "$value minutes ago";
    } else {
      final value = isWhen ~/ 1000;
      if (value == 1) {
        return "1 second ago";
      }
      return "$value seconds ago";
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWhen = DateTime.now().millisecondsSinceEpoch - moodData.createdAt;
    final isWhenText = _getWhenText(isWhen);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FractionallySizedBox(
          widthFactor: 1.0,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Paddings.moodHorizontal,
              vertical: Paddings.moodVertical,
            ),
            decoration: BoxDecoration(
              color: ColorConstants.moodColor,
              border: BoxConstants.boxBorder,
              borderRadius: BorderRadius.circular(
                BoxConstants.moodBorderRadius,
              ),
              boxShadow: [
                BoxConstants.boxShadowLeftBottom,
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mood: ${moodData.mood}",
                  style: TextStyle(
                    fontSize: TextConstants.moodSize,
                    fontWeight: TextConstants.middleWeight,
                    height: TextConstants.moodHeight,
                  ),
                ),
                Text(
                  moodData.comment,
                  style: TextStyle(
                    fontSize: TextConstants.moodSize,
                    fontWeight: TextConstants.middleWeight,
                    height: TextConstants.moodHeight,
                  ),
                ),
              ],
            ),
          ),
        ),
        Gaps.v10,
        Text(
          isWhenText,
          style: TextStyle(
            fontSize: TextConstants.smallSize,
            fontWeight: TextConstants.smallWeight,
            color: ColorConstants.moodTimeColor,
          ),
        ),
        Gaps.v28,
      ],
    );
  }
}
