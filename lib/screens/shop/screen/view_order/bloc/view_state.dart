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



class ViewErrorState extends ViewState {
  final String errorMessage;

  const ViewErrorState({
    required this.errorMessage,
  });
}



class ViewUploadedSuccessState extends ViewActionState {}

class ViewErrorScreenToLoginState extends ViewActionState {}

class ViewProductClickedState extends ViewActionState {
  final String productId;
  ViewProductClickedState({
    required this.productId,
  });
}

//cap nhat trang thai giao hang
class ViewUpdateStatusDeliveryState extends ViewActionState {
  final String message;

    ViewUpdateStatusDeliveryState({
      required this.message
    });
}
