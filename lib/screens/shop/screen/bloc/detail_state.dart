part of 'detail_bloc.dart';

@immutable
abstract class DetailState {
  const DetailState();
}

abstract class DetailActionState extends DetailState {}

class DetailInitial extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadedSuccessState extends DetailState {
  final ProductDataModels product;
  const DetailLoadedSuccessState({
    required this.product,
  });
}


class DetailErrorState extends DetailState {
  final String errorMessage;

  const DetailErrorState({
    required this.errorMessage,
  });
}




