part of 'daily_aya_cubit.dart';

sealed class DailyAyaState extends Equatable {
  const DailyAyaState();

  @override
  List<Object> get props => [];
}

final class DailyAyaInitial extends DailyAyaState {}

final class DailyAyaLoading extends DailyAyaState {}

final class DailyAyaLoaded extends DailyAyaState {
  final DailyAya dailyAya;
  const DailyAyaLoaded(this.dailyAya);
}
final class DailyAyaError extends DailyAyaState {
  final String message;
  const DailyAyaError(this.message);

  @override
  List<Object> get props => [message];
}
