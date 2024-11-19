part of 'edit_bloc.dart';

@immutable
abstract class EditState {
  const EditState();
}

abstract class EditActionState extends EditState {}

class EditInitial extends EditState {}

class EditLoadingState extends EditState {}

class EditLoadedSuccessState extends EditState {}

class EditUploadedSuccessState extends EditActionState {}

class EditErrorState extends EditState {
  final String errorMessage;

  const EditErrorState({
    required this.errorMessage,
  });
}

class EditErrorScreenToLoginState extends EditActionState {}

class EditProductClickedState extends EditActionState {
  final String productId;

  EditProductClickedState({
    required this.productId,
  });
}
