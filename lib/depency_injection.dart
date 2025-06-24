import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quranapp/core/api/dio_consumer.dart';
import 'package:quranapp/features/auth/login/data/repo/login_repo.dart';
import 'package:quranapp/features/auth/login/data/repo/login_repo_impli.dart';
import 'package:quranapp/features/auth/login/presention/manger/cubit/login_cubit.dart';
import 'package:quranapp/features/auth/signup/data/repo/signup_repo.dart';
import 'package:quranapp/features/auth/signup/data/repo/signup_repo_impli.dart';
import 'package:quranapp/features/auth/signup/presention/manger/cubit/signup_cubit.dart';


final sl = GetIt.instance;

void setup() {
  // Dependencies
  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()));
  
//

 // Repositry
 
  sl.registerLazySingleton<SignupRepo>(() => SignupRepoImpli(apiConsumer: sl()));
  sl.registerLazySingleton<LoginRepo>(() => LoginRepoImpli(apiConsumer: sl()));

 
  // Cubit




 sl.registerFactory(() => SignupCubit(sl()));
 sl.registerFactory(() => LoginCubit(sl()));

  
}
