import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quranapp/features/home/data/models/daily_aya_model.dart';
import 'package:quranapp/features/home/data/repo/surah_impl.dart';

part 'daily_aya_state.dart';

class DailyAyaCubit extends Cubit<DailyAyaState> {
   final SurahImpl surahImpl;
  DailyAyaCubit(this.surahImpl) : super(DailyAyaInitial());
  Future<void> getDailyAya() async {
    emit(DailyAyaLoading());
    var result = await surahImpl.getDailyAya();
    result.fold(
      (l) => emit(DailyAyaError(l)),
      (r) => emit(DailyAyaLoaded(r)), // r هنا قائمة
    );
  }
}
