part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginErrorState extends LoginState {
  final String errMessage;
  const LoginErrorState({required this.errMessage});
}
final class LoginSuccessState extends LoginState {
  final Auth signupModel;
  const LoginSuccessState({required this.signupModel});
}
