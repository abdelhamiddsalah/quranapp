import 'package:dartz/dartz.dart';
import 'package:quranapp/core/api/dio_consumer.dart';
import 'package:quranapp/core/api/end_points.dart';
import 'package:quranapp/core/errors/failure.dart';
import 'package:quranapp/features/auth/profile/data/models/profile_model.dart';
import 'package:quranapp/features/auth/profile/data/repo/profile_repo.dart';

class ProfileRepoImpli implements ProfileRepo {
  final DioConsumer dioConsumer;

  ProfileRepoImpli({required this.dioConsumer});
  @override
  Future<Either<Failure, UserModel>> getProfile(  ) async {
    final result = await dioConsumer.get(path: EndPoints.profile);
    return result.fold(
      (l) => Left(Failure(errMessage: 'خطأ في الاتصال: $l')),
      (response) {
        try {
          final data = response.data;
          final profile = UserModel.fromJson(data);
          return Right(profile);
        } catch (e) {
          return Left(Failure(errMessage: 'خطأ في تحويل البيانات: ${e.toString()}'));
        }
      },
    );
  }
  
}