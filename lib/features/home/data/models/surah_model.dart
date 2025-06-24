class SurahModel {
  final int id;
  final String revelationPlace;
  final String nameArabic;
  final int orderInMushaf;
  final int ayahCount;

  SurahModel({
    required this.id,
    required this.revelationPlace,
    required this.nameArabic,
    required this.orderInMushaf,
    required this.ayahCount,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      id: json['id'],
      revelationPlace: json['revelationPlace'],
      nameArabic: json['nameArabic'],
      orderInMushaf: json['orderInMushaf'],
      ayahCount: json['ayahCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'revelationPlace': revelationPlace,
      'nameArabic': nameArabic,
      'orderInMushaf': orderInMushaf,
      'ayahCount': ayahCount,
    };
  }
}
