import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproject/api/products.dart';
import 'package:myproject/model/detailsproduct/products_data_model.dart';
import 'package:myproject/model/products/product_data_model.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductInitialEvent>(productInitialEvent);
    on<ProductErrorScreenToLoginEvent>(productErrorScreenToLoginEvent);
    on<ProductClickedEvent>(productClickedEvent);
    on<ProductidClickEvent>(productidClickEvent);
  }

  Future<void> productInitialEvent(
      ProductInitialEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    try {
      final apiService = ApiServiceProducts();
      List<ProductDataModel>? listproduct = await apiService.getAllProductShop();
      emit(ProductLoadedSuccessState(listproduct: listproduct));
    } catch (e) {
      emit(ProductErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> productErrorScreenToLoginEvent(
      ProductErrorScreenToLoginEvent event, Emitter<ProductState> emit) {
    emit(ProductErrorScreenToLoginState());
  }

  FutureOr<void> productClickedEvent(
      ProductClickedEvent event, Emitter<ProductState> emit) async {
    try {
      var uri = Uri.parse("http://192.168.1.29:4000/products/createproduct");
      // Gửi yêu cầu tới server
      print('Đã qua giai đoạn này');
      final request = http.MultipartRequest("POST", uri)
        ..fields['name'] = event.name
        ..fields['description'] = event.description
        ..fields['price'] = event.price.toString()
        ..files.add(await http.MultipartFile.fromPath('images', event.image));
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseData = jsonDecode(responseBody);
        print('Thành công: $responseData');
        emit(ProductUploadedSuccessState());
      } else {
        print('Lỗi: ${response.statusCode}');
      }
    } catch (e) {
      print('Thất bại: $e');
      emit(ProductErrorState(errorMessage: e.toString()));
    }
  }

  //get product by id



  Future<void> productidClickEvent(
      ProductidClickEvent event, Emitter<ProductState> emit) async { 
    try {
      // final apiService = ApiServiceProducts();
      // ProductDataModels listproduct = await apiService.getDetailsProduct(event.productId);
      emit(ProductClickedState(productId: event.productId));
    } catch (e) {
      emit(ProductErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> productDetailsClickEvent(
      ProductDetailsClickEvent event, Emitter<ProductState> emit) async { 
        emit(ProductLoadingState());
    try {
      final apiService = ApiServiceProducts();
      ProductDataModels listproduct = await apiService.getDetailsProduct(event.productId);
      emit(ProductDetailsSuccessState(product: listproduct));
    } catch (e) {
      emit(ProductErrorState(errorMessage: e.toString()));
    }
  }



}
