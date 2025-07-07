class SurahModel {
  final int id;
  final String arabicName;
  final String? name; // لو فيه ترجمة للاسم
  final int number;
  final int versesCount;
  final String revelationPlace;

  SurahModel({
    required this.id,
    required this.arabicName,
    this.name,
    required this.number,
    required this.versesCount,
    required this.revelationPlace,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
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
  final String? ayaTextStripped; // لو عايز تستخدمه في البحث مثلًا
  final SurahModel surah;

  AyaModel({
    required this.ayaNumber,
    required this.ayaText,
    this.ayaTextStripped,
    required this.surah,
  });

  factory AyaModel.fromJson(Map<String, dynamic> json) {
    return AyaModel(
      ayaNumber: json['ayaNumber'],
      ayaText: json['ayaText'],
      ayaTextStripped: json['ayaTextStripped'],
      surah: SurahModel.fromJson(json['surah']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ayaNumber': ayaNumber,
      'ayaText': ayaText,
      'ayaTextStripped': ayaTextStripped,
      'surah': surah.toJson(),
    };
  }
}

class QuranVerse {
  final int id;
  final SurahModel surah;
  final AyaModel aya;

  QuranVerse({
    required this.id,
    required this.surah,
    required this.aya,
  });

  factory QuranVerse.fromJson(Map<String, dynamic> json) {
    return QuranVerse(
      id: json['id'],
      surah: SurahModel.fromJson(json['surah']),
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
