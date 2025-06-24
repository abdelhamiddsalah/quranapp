import 'package:dartz/dartz.dart';
import 'package:quranapp/core/errors/failure.dart';
import 'package:quranapp/features/auth/login/data/models/login_request_model.dart';
import 'package:quranapp/features/auth/signup/data/models/signup_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, Auth>> login(LoginRequestModel loginRequestModel);
}