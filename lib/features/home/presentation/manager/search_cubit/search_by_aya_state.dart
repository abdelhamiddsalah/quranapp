part of 'search_by_aya_cubit.dart';

sealed class SearchByAyaState extends Equatable {
  const SearchByAyaState();

  @override
  List<Object> get props => [];
}

final class SearchByAyaInitial extends SearchByAyaState {}
final class SearchByAyaLoading extends SearchByAyaState {}
final class SearchByAyaLoaded extends SearchByAyaState {
  final List<SearchModel> searchResults;
  const SearchByAyaLoaded(this.searchResults);
}
final class SearchByAyaError extends SearchByAyaState {
  final String errorMessage;
  const SearchByAyaError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}