import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktokfinalproject/features/mood/models.dart/mood_model.dart';

class MoodsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveThread(MoodModel data) async {
    await _db.collection("moods").add(data.toJson());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchMoods({
    int? lastItemCreatedAt,
  }) {
    final query =
        _db.collection("moods").orderBy("createdAt", descending: true).limit(5);
    if (lastItemCreatedAt == null) {
      return query.get();
    } else {
      return query.startAfter([lastItemCreatedAt]).get();
    }
  }
}

final moodsRepo = Provider(
  (ref) => MoodsRepository(),
);
