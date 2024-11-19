part of 'view_bloc.dart';

@immutable
abstract class ViewEvent {
  const ViewEvent();
}

class ViewInitialEvent extends ViewEvent {}

class ViewErrorScreenToLoginEvent extends ViewEvent {}

class ViewProductClickedEvent extends ViewEvent {
  final String name;
  final String description;
  final double price;
  final String image; // Chỉ một ảnh duy nhất

  const ViewProductClickedEvent({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}
