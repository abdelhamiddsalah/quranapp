part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}
final class ProfileLoadingState extends ProfileState {}
final class ProfileErrorState extends ProfileState {
  final String errMessage;
  const ProfileErrorState({required this.errMessage});
}
final class ProfileSuccessState extends ProfileState {
  final UserModel usermodel;
  const ProfileSuccessState({required this.usermodel});
}
