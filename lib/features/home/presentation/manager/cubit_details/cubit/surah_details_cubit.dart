import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quranapp/features/home/data/models/surah_response_model.dart';
import 'package:quranapp/features/home/data/repo/surah_impl.dart';

part 'surah_details_state.dart';

class SurahDetailsCubit extends Cubit<SurahDetailsState> {
  final SurahImpl surahimpl;

  SurahDetailsCubit(this.surahimpl) : super(SurahDetailsInitial());

  Future<void> getSurahDetails(String surahId) async {
    emit(SurahDetailsLoading());
    final result = await surahimpl.getSurahDetails(surahId);
    result.fold(
      (error) => emit(SurahDetailsError(message: error)),
      (data) => emit(SurahDetailsLoaded( response: data)),
    );
  }
}

