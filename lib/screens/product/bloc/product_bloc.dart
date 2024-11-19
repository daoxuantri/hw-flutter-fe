import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:myproject/api/products.dart'; 
import 'package:flutter/material.dart';
import 'package:myproject/model/products/product_data_model.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductInitialEvent>(productInitialEvent);
  }

  Future<FutureOr<void>> productInitialEvent(
      ProductInitialEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    try {

      ProductDataModel? product =
          await ApiServiceProducts().getDetailProduct(event.productId);


      emit(ProductLoadedSuccessState(product: product));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(ProductErrorState(errorMessage: failToken));
    }
  }
}
