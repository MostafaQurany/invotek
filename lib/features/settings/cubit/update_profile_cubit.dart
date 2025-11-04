import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/settings/data/models/update_profile_request.dart';
import 'package:invotek/features/settings/domain/usecases/update_profile.dart';

abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final User user;
  UpdateProfileSuccess(this.user);
}

class UpdateProfileError extends UpdateProfileState {
  final String message;
  UpdateProfileError(this.message);
}

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfile updateProfileUseCase;

  UpdateProfileCubit({required this.updateProfileUseCase})
      : super(UpdateProfileInitial());

  Future<void> submit(UpdateProfileRequest request) async {
    emit(UpdateProfileLoading());
    final result = await updateProfileUseCase(request);
    result.when(
      success: (response) => emit(UpdateProfileSuccess(response.user)),
      failure: (error) => emit(UpdateProfileError(error.message)),
    );
  }
}


