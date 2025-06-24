import 'package:dartz/dartz.dart';
import 'package:quranapp/core/errors/failure.dart';
import 'package:quranapp/features/auth/signup/data/models/signup_model.dart';
import 'package:quranapp/features/auth/signup/data/models/signup_request_model.dart';

abstract class SignupRepo {
  Future<Either<Failure, Auth>> signup(SignupRequestModel signupRequestModel);
}