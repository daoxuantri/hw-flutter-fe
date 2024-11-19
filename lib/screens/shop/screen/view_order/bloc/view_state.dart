part of 'view_bloc.dart';

@immutable
abstract class ViewState {
  const ViewState();
}

abstract class ViewActionState extends ViewState {}

class ViewInitial extends ViewState {}

class ViewLoadingState extends ViewState {}

class ViewLoadedSuccessState extends ViewState {
  final List<Data>? listorder;

  const ViewLoadedSuccessState({
    required this.listorder,
  });
}

class ViewUploadedSuccessState extends ViewActionState {}

class ViewErrorState extends ViewState {
  final String errorMessage;

  const ViewErrorState({
    required this.errorMessage,
  });
}

class ViewErrorScreenToLoginState extends ViewActionState {}

class ViewProductClickedState extends ViewActionState {
  final String productId;

  ViewProductClickedState({
    required this.productId,
  });
}
