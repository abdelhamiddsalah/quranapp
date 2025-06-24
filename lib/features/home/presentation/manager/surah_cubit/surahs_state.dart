part of 'surahs_cubit.dart';

@immutable
sealed class SurahsState {}

final class SurahsInitial extends SurahsState {}

final class SurahsLoading extends SurahsState {}

final class SurahsLoaded extends SurahsState {
  final List<SurahModel> surahs;
  SurahsLoaded(this.surahs);
}

final class SurahsError extends SurahsState {
  final String message;
  SurahsError(this.message);
}