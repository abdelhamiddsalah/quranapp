part of 'surah_details_cubit.dart';

abstract class SurahDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class SurahDetailsInitial extends SurahDetailsState {}

class SurahDetailsLoading extends SurahDetailsState {}

class SurahDetailsLoaded extends SurahDetailsState {
  final List<AyahModel> ayat;
  SurahDetailsLoaded({required this.ayat});

  @override
  List<Object> get props => [ayat];
}

class SurahDetailsError extends SurahDetailsState {
  final String message;
  SurahDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}
