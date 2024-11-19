part of 'edit_bloc.dart';

@immutable
abstract class EditEvent {
  const EditEvent();
}

class EditInitialEvent extends EditEvent {}

class EditErrorScreenToLoginEvent extends EditEvent {}

class EditProductClickedEvent extends EditEvent {
  final String name;
  final String description;
  final double price;
  final String image; // Chỉ một ảnh duy nhất

  const EditProductClickedEvent({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}