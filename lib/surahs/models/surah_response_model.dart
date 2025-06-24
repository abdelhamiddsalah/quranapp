import 'package:quranapp/surahs/models/aya_model.dart';
import 'package:quranapp/surahs/models/surah_model.dart';

class SurahResponseModel {
  final SurahModel surah;
  final List<AyahModel> ayat;

  SurahResponseModel({
    required this.surah,
    required this.ayat,
  });

  factory SurahResponseModel.fromJson(Map<String, dynamic> json) {
    return SurahResponseModel(
      surah: SurahModel.fromJson(json['surah']),
      ayat: List<AyahModel>.from(
        json['ayat'].map((ayah) => AyahModel.fromJson(ayah)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'surah': surah.toJson(),
        'ayat': ayat.map((e) => e.toJson()).toList(),
      };
}
