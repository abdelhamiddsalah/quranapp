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
  Future<Either<Failure, QuranVerseModel>> addFavorite(int id)async {
  final result = await dioConsumer.post(path: EndPoints.addFavorite(id));
  return result.fold((l) => Left(Failure(errMessage: l)), (r) => Right(QuranVerseModel.fromJson(r.data)));
  }

  @override
  Future<Either<Failure, List<QuranVerseModel>>> getFavorites() {
   final result = dioConsumer.get(path: EndPoints.getFavorites);
   return result.then((value) {
     return value.fold((l) => Left(Failure(errMessage: l)), (r) => Right(r.data.map((e) => SurahModel.fromJson(e)).toList()));
   });
  }

  @override
  Future<Either<Failure, bool>> isFavorite(int id) {
  final result = dioConsumer.get(path: EndPoints.addFavorite(id));
  return result.then((value) {
    return value.fold(
      (l) => Left(Failure(errMessage: l)),
      (r) => Right(r.data['is_favorite'] ?? false),
    );
  });
  }
}