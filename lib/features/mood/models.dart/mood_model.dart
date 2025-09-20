class MoodModel {
  final String mood;
  final String comment;
  final String creatorUid;
  final int createdAt;

  MoodModel({
    required this.mood,
    required this.comment,
    required this.creatorUid,
    required this.createdAt,
  });

  MoodModel.fromJson({
    required Map<String, dynamic> json,
  })  : mood = json["mood"],
        comment = json["comment"],
        creatorUid = json["creatorUid"],
        createdAt = json["createdAt"];

  Map<String, dynamic> toJson() {
    return {
      "mood": mood,
      "comment": comment,
      "creatorUid": creatorUid,
      "createdAt": createdAt,
    };
  }
}
