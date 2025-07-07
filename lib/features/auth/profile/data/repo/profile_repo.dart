

import 'package:dartz/dartz.dart';
import 'package:quranapp/core/errors/failure.dart';
import 'package:quranapp/features/auth/profile/data/models/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> getProfile();
}