import 'package:dartz/dartz.dart';
import 'package:quranapp/core/errors/failure.dart';
import 'package:quranapp/features/favorite/data/models/favorite_model.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, List<QuranVerseModel>>> getFavorites();

  Future<Either<Failure, QuranVerseModel>> addFavorite(int surahId, int ayaNumber);

  Future<Either<Failure, bool>> isFavorite(int surahId, int ayaNumber);
}
