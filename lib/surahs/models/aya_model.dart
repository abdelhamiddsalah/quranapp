class AyahModel {
  final int ayaNumber;
  final String ayaText;
  final String ayaTafsir;
  final String audioUrl;

  AyahModel({
    required this.ayaNumber,
    required this.ayaText,
    required this.ayaTafsir,
    required this.audioUrl,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    return AyahModel(
      ayaNumber: json['ayaNumber'],
      ayaText: json['ayaText'],
      ayaTafsir: json['ayaTafsir'],
      audioUrl: json['audioUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'ayaNumber': ayaNumber,
        'ayaText': ayaText,
        'ayaTafsir': ayaTafsir,
        'audioUrl': audioUrl,
      };
}
