import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quranapp/apis/dio_consumer.dart';
import 'package:quranapp/surahs/cubit/surahs_cubit.dart';
import 'package:quranapp/surahs/imples/surah_impl.dart';

final sl = GetIt.instance;

void init() {
  // تسجيل Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // تسجيل DioConsumer وتعتمد على Dio
  sl.registerLazySingleton(() => DioConsumer(dio: sl()));

  // تسجيل SurahImpl وتعتمد على DioConsumer
  sl.registerLazySingleton(() => SurahImpl(sl()));

  // تسجيل SurahsCubit وتعتمد على SurahImpl
  sl.registerFactory(() => SurahsCubit(sl()));
}
