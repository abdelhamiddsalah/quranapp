import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/core/cache/cache_helper.dart';
import 'package:quranapp/features/auth/login/data/models/login_request_model.dart';
import 'package:quranapp/features/auth/login/data/repo/login_repo.dart';
import 'package:quranapp/features/auth/signup/data/models/signup_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo signupRepoImpli;
  LoginCubit(this.signupRepoImpli) : super(LoginInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> signup(LoginRequestModel loginRequestModel) async {
    emit(LoginLoadingState());
    final result = await signupRepoImpli.login(loginRequestModel);

    result.fold((l) => emit(LoginErrorState(errMessage: l.errMessage)), (r) {
      if (r.token != null ) {
        emit(LoginSuccessState(signupModel: r));
        CacheHelper().saveData(key: 'token', value: r.token);
       
      } else {
        emit(LoginErrorState(errMessage: r.message));
      }
    });
  }
}
