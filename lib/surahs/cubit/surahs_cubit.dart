import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quranapp/surahs/imples/surah_impl.dart';
import 'package:quranapp/surahs/models/surah_model.dart';

part 'surahs_state.dart';

class SurahsCubit extends Cubit<SurahsState> {
  final SurahImpl surahImpl;
  SurahsCubit(this.surahImpl) : super(SurahsInitial());

  Future<void> getSurahs() async {
    emit(SurahsLoading());
    var result = await surahImpl.getSurahs();
    result.fold(
      (l) => emit(SurahsError(l)),
      (r) => emit(SurahsLoaded(r)), // r هنا قائمة
    );
  }

}
