import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktokfinalproject/features/mood/models.dart/mood_model.dart';
import 'package:tiktokfinalproject/features/mood/repos/moods_repo.dart';
import 'package:tiktokfinalproject/utils.dart';

class MoodViewModel extends AsyncNotifier<void> {
  late final MoodsRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(moodsRepo);
  }

  Future<void> uploadMood(
    String mood,
    String comment,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.saveThread(
        MoodModel(
          mood: mood,
          comment: comment,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    });
    if (state.hasError) {
      showFirebaseErrorSnack(
        context,
        state.error,
      );
    } else {
      context.pushReplacement("/home");
    }
  }
}

final moodProvider = AsyncNotifierProvider<MoodViewModel, void>(
  () => MoodViewModel(),
);
