part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {
  const DetailEvent();
}

class DetailInitialEvent extends DetailEvent {
  final String productId;
  const DetailInitialEvent({
    required this.productId
  });
}


