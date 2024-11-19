import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproject/api/products.dart';
import 'package:myproject/model/detailsproduct/products_data_model.dart';
import 'package:myproject/model/products/product_data_model.dart';
part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<DetailInitialEvent>(detailInitialEvent);
  }

  Future<void> detailInitialEvent(
      DetailInitialEvent event, Emitter<DetailState> emit) async {
    emit(DetailLoadingState());
    try {
          final apiService = ApiServiceProducts();
          ProductDataModels product = await apiService.getDetailsProduct(event.productId);
      emit(DetailLoadedSuccessState(product: product));
    } catch (e) {
      emit(DetailErrorState(errorMessage: e.toString()));
    }
  }

  // FutureOr<void> productErrorScreenToLoginEvent(
  //     ProductErrorScreenToLoginEvent event, Emitter<ProductState> emit) {
  //   emit(ProductErrorScreenToLoginState());
  // }

  //get product by id



  // Future<void> productidClickEvent(
  //     ProductidClickEvent event, Emitter<ProductState> emit) async { 
  //   try {
  //     // final apiService = ApiServiceProducts();
  //     // ProductDataModels listproduct = await apiService.getDetailsProduct(event.productId);
  //     emit(ProductClickedState(productId: event.productId));
  //   } catch (e) {
  //     emit(ProductErrorState(errorMessage: e.toString()));
  //   }
  // }

  // Future<void> productDetailsClickEvent(
  //     ProductDetailsClickEvent event, Emitter<ProductState> emit) async { 
  //       emit(ProductLoadingState());
  //   try {
  //     final apiService = ApiServiceProducts();
  //     ProductDataModels listproduct = await apiService.getDetailsProduct(event.productId);
  //     emit(ProductDetailsSuccessState(product: listproduct));
  //   } catch (e) {
  //     emit(ProductErrorState(errorMessage: e.toString()));
  //   }
  // }



}
