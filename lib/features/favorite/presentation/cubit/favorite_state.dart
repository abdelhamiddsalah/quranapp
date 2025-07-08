part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}
final class FavoriteLoading extends FavoriteState {}
final class FavoriteLoaded extends FavoriteState {
  final List<QuranVerseModel> favorites;
  const FavoriteLoaded({required this.favorites});
}
final class FavoriteAdded extends FavoriteState {
  final QuranVerseModel favorite;
  const FavoriteAdded({required this.favorite});
}
final class FavoriteStatus extends FavoriteState {
  final bool isFavorite;
  const FavoriteStatus({required this.isFavorite});
}
final class FavoriteError extends FavoriteState {
  final String message;
  const FavoriteError({required this.message});
}
