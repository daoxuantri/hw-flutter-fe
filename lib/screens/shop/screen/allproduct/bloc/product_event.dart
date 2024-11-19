part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {
  const ProductEvent();
}

class ProductInitialEvent extends ProductEvent {}

class ProductErrorScreenToLoginEvent extends ProductEvent {}

class ProductClickedEvent extends ProductEvent {
  final String name;
  final String description;
  final double price;
  final String image; // Chỉ một ảnh duy nhất

  const ProductClickedEvent({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}
