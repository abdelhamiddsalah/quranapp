part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}
final class SignupLoadingState extends SignupState {}
final class SignupErrorState extends SignupState {
  final String errMessage;
  const SignupErrorState({required this.errMessage});
}
final class SignupSuccessState extends SignupState {
  final Auth signupModel;
  const SignupSuccessState({required this.signupModel});
}
