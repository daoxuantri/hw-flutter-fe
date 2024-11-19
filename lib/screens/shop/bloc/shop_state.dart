part of 'shop_bloc.dart';

@immutable
abstract class ShopState {
  const ShopState();
}

abstract class ShopActionState extends ShopState {}

class ShopInitial extends ShopState {}

class ShopLoadingState extends ShopState {}

class ShopLoadedSuccessState extends ShopState {
}

class ShopErrorState extends ShopState {
  final String errorMessage;
  
  const ShopErrorState({
    required this.errorMessage,
  });
}

class ShopErrorScreenToLoginState extends ShopActionState {}

class ShopProductClickedState extends ShopActionState {
  final String productId;
  
  ShopProductClickedState({
    required this.productId,
  });
}