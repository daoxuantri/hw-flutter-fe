part of 'product_bloc.dart';

@immutable
abstract class ProductState {
  const ProductState();
}

abstract class ProductActionState extends ProductState {}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedSuccessState extends ProductState {
  final List<ProductDataModel> listproduct;
  const ProductLoadedSuccessState({
    required this.listproduct,
  });
}

//get product by id
class ProductDetailsSuccessState extends ProductState {
  final ProductDataModels product;

  ProductDetailsSuccessState({
    required this.product,
  });
} 

class ProductUploadedSuccessState extends ProductActionState {}

class ProductErrorState extends ProductState {
  final String errorMessage;

  const ProductErrorState({
    required this.errorMessage,
  });
}

class ProductErrorScreenToLoginState extends ProductActionState {}

class ProductClickedState extends ProductActionState {
  final String productId;

  ProductClickedState({
    required this.productId,
  });
}


