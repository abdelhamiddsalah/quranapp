import 'package:dartz/dartz.dart';
import 'package:quranapp/core/api/dio_consumer.dart';
import 'package:quranapp/core/api/end_points.dart';
import 'package:quranapp/features/home/data/models/daily_aya_model.dart';
import 'package:quranapp/features/home/data/models/search_model.dart';
import 'package:quranapp/features/home/data/models/surah_model.dart';
import 'package:quranapp/features/home/data/models/surah_response_model.dart';

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

  Future<Either<String, List<SearchModel>>> getAyatBysearch(String keyword) async {
  final encodedKeyword = Uri.encodeComponent(keyword);
  final result = await dioConsumer.get(path: EndPoints.search(encodedKeyword));

  return result.fold((l) => Left(l), (response) {
    try {
      final data = response.data;

      if (data is List) {
        final surahs = data
            .map((e) => SearchModel.fromJson(e as Map<String, dynamic>))
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

 Future<Either<String, SurahResponseModel>> getSurahDetails(String surahId) async {
  final result = await dioConsumer.get(path: EndPoints.surahDetails(surahId));

  return result.fold(
    (l) => Left(l),
    (response) {
      try {
        final model = SurahResponseModel.fromJson(response.data);
        return Right(model);
      } catch (e) {
        return Left('خطأ في تحويل البيانات: ${e.toString()}');
      }
    },
  );
}

Future<Either<String, DailyAya>> getDailyAya() async {
  final result = await dioConsumer.get(path: EndPoints.dailyAya);

  return result.fold(
    (l) => Left(l),
    (response) {
      try {
        final model = DailyAya.fromJson(response.data);
        return Right(model);
      } catch (e) {
        return Left('خطأ في تحويل البيانات: ${e.toString()}');
      }
    },
  );
}


}

   
