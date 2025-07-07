import 'package:dartz/dartz.dart';
import 'package:quranapp/core/errors/failure.dart';
import 'package:quranapp/features/home/data/models/surah_model.dart';

abstract class FavoriteRepo {
  // A simple in-memory list to store favorite item IDs

  Future<Either<Failure, List<SurahModel>> >getFavorites();

  Future<Either<Failure, SurahModel>> addFavorite(int id);

  Future<Either<Failure, bool>> isFavorite(int id);
}
