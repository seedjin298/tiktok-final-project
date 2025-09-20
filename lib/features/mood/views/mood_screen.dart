import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktokfinalproject/common/appbar/mood_appbar.dart';
import 'package:tiktokfinalproject/constants/paddings.dart';
import 'package:tiktokfinalproject/constants/text.dart';
import 'package:tiktokfinalproject/features/mood/models.dart/mood_model.dart';
import 'package:tiktokfinalproject/features/mood/view_models/mood_view_model.dart';
import 'package:tiktokfinalproject/features/mood/view_models/timeline_view_model.dart';
import 'package:tiktokfinalproject/features/mood/views/widgets/mood.dart';

class MoodScreen extends ConsumerWidget {
  static const routeUrl = "/home";
  static const routeName = "home";

  const MoodScreen({super.key});

  void _onMoodLongPress(MoodModel mood, BuildContext context, WidgetRef ref) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text(
          "Delete note",
          style: TextStyle(
            fontWeight: TextConstants.titleWeight,
          ),
        ),
        message: Text(
          "Are you sure you want to do this?",
          style: TextStyle(
            fontWeight: TextConstants.normalWeight,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              ref.read(moodProvider.notifier).deleteMood(mood, context);
              Navigator.of(context).pop();
            },
            child: Text(
              "Delete",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "Cancel",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return ref.watch(moodStreamProvider).when(
          error: (error, stackTrace) => Center(
            child: Text(
              'Could not load moods: $error',
              style: TextStyle(color: Colors.white),
            ),
          ),
          loading: () => Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          data: (moods) {
            return Scaffold(
              appBar: MoodAppBar(
                isLoggedIn: true,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Paddings.moodScreenHorizontal,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.055,
                      ),
                      for (var mood in moods)
                        GestureDetector(
                          onLongPress: () =>
                              _onMoodLongPress(mood, context, ref),
                          child: Mood(
                            moodData: mood,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
  }
}
