import 'package:dartz/dartz.dart';
import 'package:quranapp/core/api/dio_consumer.dart';
import 'package:quranapp/core/api/end_points.dart';
import 'package:quranapp/core/errors/failure.dart';
import 'package:quranapp/features/auth/login/data/models/login_request_model.dart';
import 'package:quranapp/features/auth/login/data/repo/login_repo.dart';
import 'package:quranapp/features/auth/signup/data/models/signup_model.dart';

class LoginRepoImpli implements LoginRepo {
  final DioConsumer apiConsumer;

  LoginRepoImpli({required this.apiConsumer});
  @override
  Future<Either<Failure, Auth>> login(LoginRequestModel loginRequestModel) async {
    try {
  final response = await apiConsumer.post(
    data: loginRequestModel.toJson(),
    path: EndPoints.login,
  );
  return response.fold(
     (l) => Left(Failure(errMessage: l)),
     
    (r) => Right(Auth.fromJson(r.data)),
  );
} on Exception catch (e) {
       return Left(Failure(errMessage: e.toString()));
}
  }
}