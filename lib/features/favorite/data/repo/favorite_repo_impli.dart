import 'package:dartz/dartz.dart';
import 'package:quranapp/core/api/dio_consumer.dart';
import 'package:quranapp/core/api/end_points.dart';
import 'package:quranapp/core/errors/failure.dart';
import 'package:quranapp/features/favorite/data/models/favorite_model.dart';
import 'package:quranapp/features/favorite/data/repo/favorite_repo.dart';

class FavoriteRepoImpli implements FavoriteRepo {
  final DioConsumer dioConsumer;
  FavoriteRepoImpli({required this.dioConsumer});

  @override
  Future<Either<Failure, QuranVerseModel>> addFavorite(int surahId, int ayaNumber) async {
    final result = await dioConsumer.post(
      path: EndPoints.addFavorite(surahId, ayaNumber),
    );
    return result.fold(
      (l) => Left(Failure(errMessage: l)),
      (r) => Right(QuranVerseModel.fromJson(r.data)),
    );
  }

  Future<Either<Failure, List<QuranVerseModel>>> getFavorites() async {
  final result = await dioConsumer.get(path: EndPoints.getFavorites);
  return result.fold(
    (l) => Left(Failure(errMessage: l)),
    (r) {
      final data = r.data;
      if (data is List) {
        return Right(data.map((e) => QuranVerseModel.fromJson(e)).toList());
      } else {
        return Left(Failure(errMessage: 'Unexpected response format'));
      }
    },
  );
}


  @override
Future<Either<Failure, bool>> isFavorite(int surahId, int ayaNumber) async {
  final result = await dioConsumer.get(
    path: EndPoints.isFavorite(surahId, ayaNumber),
  );
  return result.fold(
    (l) => Left(Failure(errMessage: l)),
    (r) => Right(r.data is bool ? r.data : false),
  );
}

}
