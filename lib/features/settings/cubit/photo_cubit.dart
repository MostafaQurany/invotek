import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/settings/domain/usecases/update_photo.dart';

abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoUploading extends PhotoState {}

class PhotoUpdated extends PhotoState {
  final User user;
  PhotoUpdated(this.user);
}

class PhotoError extends PhotoState {
  final String message;
  PhotoError(this.message);
}

class PhotoCubit extends Cubit<PhotoState> {
  final UpdatePhoto updatePhotoUseCase;

  PhotoCubit({required this.updatePhotoUseCase}) : super(PhotoInitial());

  Future<void> upload(File file) async {
    emit(PhotoUploading());
    final result = await updatePhotoUseCase(file);
    result.when(
      success: (response) => emit(PhotoUpdated(response.user)),
      failure: (error) => emit(PhotoError(error.message)),
    );
  }
}


