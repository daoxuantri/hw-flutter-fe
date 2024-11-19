part of 'shop_bloc.dart';

@immutable
abstract class ShopEvent {
  const ShopEvent();
}

class ShopInitialEvent extends ShopEvent {}

class ShopErrorScreenToLoginEvent extends ShopEvent {}

class ShopProductClickedEvent extends ShopEvent {
  final String productId;
  const ShopProductClickedEvent({
    required this.productId,
  });
}