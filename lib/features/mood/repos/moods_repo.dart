import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktokfinalproject/features/mood/models.dart/mood_model.dart';

class MoodsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveMood(MoodModel data) async {
    await _db.collection("moods").add(data.toJson());
  }

  Future<void> deleteMood(MoodModel data) async {
    final moodsRef = _db.collection("moods");
    final result =
        await moodsRef.where("createdAt", isEqualTo: data.createdAt).get();
    final documentId = result.docs.first.id;
    await moodsRef.doc(documentId).delete();
  }
}

final moodsRepo = Provider(
  (ref) => MoodsRepository(),
);
