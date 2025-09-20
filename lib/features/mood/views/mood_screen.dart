import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktokfinalproject/common/appbar/mood_appbar.dart';
import 'package:tiktokfinalproject/constants/paddings.dart';
import 'package:tiktokfinalproject/features/mood/models.dart/mood_model.dart';
import 'package:tiktokfinalproject/features/mood/view_models/timeline_view_model.dart';
import 'package:tiktokfinalproject/features/mood/views/widgets/mood.dart';

class MoodScreen extends ConsumerWidget {
  static const routeUrl = "/home";
  static const routeName = "home";

  const MoodScreen({super.key});

  void _onMoodLongPress(MoodModel mood) {}

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
                          onLongPress: () => _onMoodLongPress(mood),
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
