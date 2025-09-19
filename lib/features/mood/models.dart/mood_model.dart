class MoodModel {
  final String mood;
  final String comment;
  final int createdAt;

  MoodModel({
    required this.mood,
    required this.comment,
    required this.createdAt,
  });

  MoodModel.fromJson({
    required Map<String, dynamic> json,
  })  : mood = json["mood"],
        comment = json["comment"],
        createdAt = json["createdAt"];

  Map<String, dynamic> toJson() {
    return {
      "mood": mood,
      "comment": comment,
      "createdAt": createdAt,
    };
  }
}
