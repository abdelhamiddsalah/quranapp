import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quranapp/features/favorite/data/models/favorite_model.dart';
import 'package:quranapp/features/favorite/data/repo/favorite_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;
  
  FavoriteCubit({required this.favoriteRepo}) : super(FavoriteInitial());

  Future<void> getFavorites() async {
    emit(FavoriteLoading());
    final result = await favoriteRepo.getFavorites();
    result.fold(
      (failure) => emit(FavoriteError(message: failure.errMessage)),
      (favorites) => emit(FavoriteLoaded(favorites: favorites)),
    );
  }

  Future<void> addFavorite(int surahId, int ayaNumber) async {
    emit(FavoriteLoading());

    final result = await favoriteRepo.addFavorite(surahId, ayaNumber);
    result.fold(
      (error) => emit(FavoriteError(message: error.errMessage)),
      (favoriteModel) => emit(FavoriteAdded(favorite: favoriteModel)),
    );
  }

Future<bool> checkIfFavorite(int surahId, int ayaNumber) async {
  final result = await favoriteRepo.isFavorite(surahId, ayaNumber);
  return result.fold(
    (failure) => false,
    (isFav) => isFav,
  );
}


}
