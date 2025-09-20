import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktokfinalproject/features/mood/models.dart/mood_model.dart';

final moodStreamProvider = StreamProvider.autoDispose<List<MoodModel>>((ref) {
  final db = FirebaseFirestore.instance;

  return db.collection("moods").orderBy("createdAt").snapshots().map(
        (event) => event.docs
            .map(
              (doc) => MoodModel.fromJson(
                json: doc.data(),
              ),
            )
            .toList()
            .reversed
            .toList(),
      );
});
