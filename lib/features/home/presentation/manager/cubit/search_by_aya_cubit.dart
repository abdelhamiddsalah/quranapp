import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quranapp/features/home/data/models/search_model.dart';
import 'package:quranapp/features/home/data/repo/surah_impl.dart';

part 'search_by_aya_state.dart';

class SearchByAyaCubit extends Cubit<SearchByAyaState> {
   final SurahImpl surahImpl;
  SearchByAyaCubit(this.surahImpl) : super(SearchByAyaInitial());

   Future<void> getAyatBysearch(String keyword) async {
    emit(SearchByAyaLoading());
    var result = await surahImpl.getAyatBysearch(keyword);
    result.fold(
      (l) => emit(SearchByAyaError('لا توجد آيات تحتوي على الكلمة المطلوب')),
      (r) => emit(SearchByAyaLoaded(r)), 
    );
  }
}
