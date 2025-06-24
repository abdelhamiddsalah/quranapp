class SearchModel {
  final String ayaText;
  final int ayaNumber;
  final String ayaTextStripped;
  final int ayaSearchId;

  SearchModel({
    required this.ayaText,
    required this.ayaNumber,
    required this.ayaTextStripped,
    required this.ayaSearchId,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      ayaText: json['ayaText'] as String,
      ayaNumber: json['ayaNumber'] as int,
      ayaTextStripped: json['ayaTextStripped'] as String,
      ayaSearchId: json['aya_search_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ayaText': ayaText,
      'ayaNumber': ayaNumber,
      'ayaTextStripped': ayaTextStripped,
      'aya_search_id': ayaSearchId,
    };
  }
}
