import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/settings/domain/usecases/get_profile.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User user;
  ProfileLoaded(this.user);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfile getProfileUseCase;

  ProfileCubit({required this.getProfileUseCase}) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    final result = await getProfileUseCase(const NoParams());
    result.when(
      success: (response) => emit(ProfileLoaded(response.user)),
      failure: (error) => emit(ProfileError(error.message)),
    );
  }
}


