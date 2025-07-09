class FavoriteModel {
  final int id;
  final String arabicName;
  final String? name;
  final int number;
  final int versesCount;
  final String revelationPlace;

  FavoriteModel({
    required this.id,
    required this.arabicName,
    this.name,
    required this.number,
    required this.versesCount,
    required this.revelationPlace,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      arabicName: json['arabicName'],
      name: json['name'],
      number: json['number'],
      versesCount: json['versesCount'],
      revelationPlace: json['revelationPlace'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'arabicName': arabicName,
      'name': name,
      'number': number,
      'versesCount': versesCount,
      'revelationPlace': revelationPlace,
    };
  }
}

class AyaModel {
  final int ayaNumber;
  final String ayaText;
  final String? audioUrl;
  final String? ayaTafsir;
  final FavoriteModel surah;

  AyaModel({
    required this.ayaNumber,
    required this.ayaText,
    this.audioUrl,
    this.ayaTafsir,
    required this.surah,
  });

  factory AyaModel.fromJson(Map<String, dynamic> json) {
    return AyaModel(
      ayaNumber: json['ayaNumber'],
      ayaText: json['ayaText'],
      audioUrl: json['audioUrl'],
      ayaTafsir: json['ayaTafsir'],
      surah: FavoriteModel.fromJson(json['surah']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ayaNumber': ayaNumber,
      'ayaText': ayaText,
      'audioUrl': audioUrl,
      'ayaTafsir': ayaTafsir,
      'surah': surah.toJson(),
    };
  }
}

class QuranVerseModel {
  final int id;
  final FavoriteModel surah;
  final AyaModel aya;

  QuranVerseModel({
    required this.id,
    required this.surah,
    required this.aya,
  });

  factory QuranVerseModel.fromJson(Map<String, dynamic> json) {
    return QuranVerseModel(
      id: json['id'],
      surah: FavoriteModel.fromJson(json['surah']),
      aya: AyaModel.fromJson(json['aya']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'surah': surah.toJson(),
      'aya': aya.toJson(),
    };
  }
}
