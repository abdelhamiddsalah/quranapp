import 'package:dartz/dartz.dart';
import 'package:quranapp/core/errors/failure.dart';
import 'package:quranapp/features/favorite/data/models/favorite_model.dart';

abstract class FavoriteRepo {
  // A simple in-memory list to store favorite item IDs

  Future<Either<Failure, List<QuranVerseModel>> >getFavorites();

  Future<Either<Failure, QuranVerseModel>> addFavorite(int id);

  Future<Either<Failure, bool>> isFavorite(int id);
}
