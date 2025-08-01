import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/core/cache/cache_helper.dart';
import 'package:quranapp/features/auth/signup/data/models/signup_model.dart';
import 'package:quranapp/features/auth/signup/data/models/signup_request_model.dart';
import 'package:quranapp/features/auth/signup/data/repo/signup_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepoImpli;
  SignupCubit(this.signupRepoImpli) : super(SignupInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> signup(SignupRequestModel signupRequestModel) async {
    emit(SignupLoadingState());
    final result = await signupRepoImpli.signup(signupRequestModel);

    result.fold((l) => emit(SignupErrorState(errMessage: l.errMessage)), (r) {
      if (r.message == 'Invalid email or password' ) {
                emit(SignupErrorState(errMessage: r.message));

      } else {emit(SignupSuccessState(signupModel: r));
              CacheHelper().saveData(key: 'token', value: r.token);

      }
    });
  }
}
