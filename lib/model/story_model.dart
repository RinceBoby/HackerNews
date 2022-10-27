class StoryModel {
  final String? title;
  final String? url;
  final String? by;
  final int? score;
  final int? time;
  List<int>? commentIds = [];

  StoryModel({
    this.title,
    this.url,
    this.commentIds,
    this.by,
    this.score,
    this.time,
  });

  factory StoryModel.fromJSON(Map<String, dynamic> json) {
    return StoryModel(
      title: json["title"],
      url: json["url"],
      commentIds: json["kids"] == null ? [] : json["kids"].cast<int>(),
      by: json["by"],
      score: json["score"],
    );
  }
}
