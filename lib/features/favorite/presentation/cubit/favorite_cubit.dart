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
  Future<void> addFavorite(int id) async {
    emit(FavoriteLoading());
    final result = await favoriteRepo.addFavorite(id);
    result.fold(
      (failure) => emit(FavoriteError(message: failure.errMessage)),
      (favorite) => emit(FavoriteAdded(favorite: favorite)),
    );
  }
  Future<void> isFavorite(int id) async {
    emit(FavoriteLoading());
    final result = await favoriteRepo.isFavorite(id);
    result.fold(
      (failure) => emit(FavoriteError(message: failure.errMessage)),
      (isFav) => emit(FavoriteStatus(isFavorite: isFav)),
    );
  }
}
