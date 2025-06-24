import 'package:dartz/dartz.dart';
import 'package:quranapp/core/api/dio_consumer.dart';
import 'package:quranapp/core/api/end_points.dart';
import 'package:quranapp/features/home/data/models/surah_model.dart';

class SurahImpl {
  final DioConsumer dioConsumer;
  SurahImpl(this.dioConsumer);

 Future<Either<String, List<SurahModel>>> getSurahs() async {
  try {
    var res = await dioConsumer.get(path: EndPoints.surahEndpoint);
    List<SurahModel> surahs = (res as List)
        .map((json) => SurahModel.fromJson(json))
        .toList();
    return right(surahs);
  } catch (e) {
    return left(e.toString());
  }
}
}