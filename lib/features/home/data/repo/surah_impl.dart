import 'package:dartz/dartz.dart';
import 'package:quranapp/core/api/dio_consumer.dart';
import 'package:quranapp/core/api/end_points.dart';
import 'package:quranapp/features/home/data/models/surah_model.dart';

class SurahImpl {
  final DioConsumer dioConsumer;
  SurahImpl(this.dioConsumer);

Future<Either<String, List<SurahModel>>> getSurahs() async {
  final result = await dioConsumer.get(path: EndPoints.surahEndpoint);

  return result.fold(
    (l) => Left(l),
    (response) {
      try {
        final data = response.data as List;
        
        final surahs = data
            .map((e) => SurahModel.fromJson(e ))
            .toList();
        return Right(surahs);
      } catch (e) {
        return Left('خطأ في تحويل البيانات: ${e.toString()}');
      }
    },
  );
}

}