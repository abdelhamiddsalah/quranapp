import 'package:dartz/dartz.dart';
import 'package:quranapp/core/api/dio_consumer.dart';
import 'package:quranapp/core/api/end_points.dart';
import 'package:quranapp/features/home/data/models/surah_model.dart';

class SurahImpl {
  final DioConsumer dioConsumer;
  SurahImpl(this.dioConsumer);

  Future<Either<String, List<SurahModel>>> getSurahs() async {
    final result = await dioConsumer.get(path: EndPoints.surahEndpoint);

    return result.fold((l) => Left(l), (response) {
      try {
        final data = response.data as List;

        final surahs = data.map((e) => SurahModel.fromJson(e)).toList();
        return Right(surahs);
      } catch (e) {
        return Left('خطأ في تحويل البيانات: ${e.toString()}');
      }
    });
  }

  Future<Either<String, List<SurahModel>>> getAyatBysearch(String keyword) async {
  final encodedKeyword = Uri.encodeComponent(keyword);
  final result = await dioConsumer.get(path: EndPoints.search(encodedKeyword));

  return result.fold((l) => Left(l), (response) {
    try {
      final data = response.data;

      if (data is List) {
        final surahs = data
            .map((e) => SurahModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return Right(surahs);
      } else {
        return Left('البيانات ليست من النوع المتوقع List');
      }
    } catch (e) {
      return Left('خطأ في تحويل البيانات: ${e.toString()}');
    }
  });
}

}
