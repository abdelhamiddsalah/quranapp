import 'package:dartz/dartz.dart';
import 'package:quranapp/core/api/dio_consumer.dart';
import 'package:quranapp/core/api/end_points.dart';
import 'package:quranapp/core/errors/failure.dart';
import 'package:quranapp/features/auth/signup/data/models/signup_model.dart';
import 'package:quranapp/features/auth/signup/data/models/signup_request_model.dart';
import 'package:quranapp/features/auth/signup/data/repo/signup_repo.dart';

class SignupRepoImpli implements SignupRepo {
  final DioConsumer apiConsumer;

  SignupRepoImpli({required this.apiConsumer});
  @override
  Future<Either<Failure, Auth>> signup(SignupRequestModel signupRequestModel) async {
    try {
  final response = await apiConsumer.post(
    data: signupRequestModel.toJson(),
    path: EndPoints.signup,
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