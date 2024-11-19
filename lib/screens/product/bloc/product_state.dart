part of 'product_bloc.dart';

@immutable
abstract class ProductState {
  const ProductState();
}

abstract class ProductActionState extends ProductState {}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedSuccessState extends ProductState {
  final ProductDataModel product;

  const ProductLoadedSuccessState(
      {required this.product });
  
}

class ProductErrorState extends ProductState {
  final String errorMessage;

  const ProductErrorState({
    required this.errorMessage,
  });
}

class ProductPostClickedActionState extends ProductActionState {
  final ProductDataModel product;

  ProductPostClickedActionState({
    required this.product,
  });
}

@immutable
abstract class ProductSubState extends ProductState {
  const ProductSubState();
}

class ProducSubtInitial extends ProductSubState {}

class ProductSubSuccess extends ProductSubState {
  final bool check;

  ProductSubSuccess({
    required this.check,
  });
}

class ProductTab1ClickedActionState extends ProductState {}

class ProductTab2ClickedActionState extends ProductState {}


class CreateOrderActionState extends ProductActionState{}
class CreateOrderErrorActionState extends ProductActionState{
  final String message;

  CreateOrderErrorActionState({required this.message});
}

class InitialOrderActionState extends ProductState{
  // final VendorShippingAddressData? address;

  // InitialOrderActionState({required this.address});
}
