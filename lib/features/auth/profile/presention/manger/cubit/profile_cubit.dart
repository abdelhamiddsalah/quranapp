import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quranapp/features/auth/profile/data/models/profile_model.dart';
import 'package:quranapp/features/auth/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {

  final ProfileRepo  profilerepoimpl;

 ProfileCubit(this.profilerepoimpl) : super(ProfileInitial());
Future<void> getProfile() async {
    emit(ProfileLoadingState());
    final result = await profilerepoimpl.getProfile();
    result.fold(
      (l) => emit(ProfileErrorState(errMessage: l.errMessage)),
      (r) => emit(ProfileSuccessState(usermodel: r)),
    );
  }
}
