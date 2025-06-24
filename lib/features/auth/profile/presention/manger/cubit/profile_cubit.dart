import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quranapp/features/auth/profile/data/models/profile_model.dart';
import 'package:quranapp/features/auth/profile/data/repo/profile_repo_impli.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {

  final ProfileRepoImpli profilerepoimpl;

 ProfileCubit(this.profilerepoimpl) : super(ProfileInitial());
Future<void> getProfile(int id) async {
    emit(ProfileLoadingState());
    final result = await profilerepoimpl.getProfile(id);
    result.fold(
      (l) => emit(ProfileErrorState(errMessage: l.errMessage)),
      (r) => emit(ProfileSuccessState(usermodel: r)),
    );
  }

  
}
