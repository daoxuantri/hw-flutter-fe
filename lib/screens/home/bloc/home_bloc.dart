import 'dart:async'; 
import 'package:bloc/bloc.dart'; 
import 'package:meta/meta.dart';
import 'package:myproject/api/products.dart';
import 'package:myproject/model/products/product_data_model.dart';


part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeErrorScreenToLoginEvent>(homeErrorScreenToLoginEvent);
    on<HomeProductClickedEvent>(homeProductClickedEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      List<ProductDataModel> products = await ApiServiceProducts().getAllProduct();
        List<ProductDataModel>? dataPropose = products;
        emit(HomeLoadedSuccessState(productsPropose: dataPropose!));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(HomeErrorState(errorMessage: failToken));
    }
  }

  FutureOr<void> homeErrorScreenToLoginEvent(
      HomeErrorScreenToLoginEvent event, Emitter<HomeState> emit) {
    emit(HomeErrorScreenToLoginState());
  }

  FutureOr<void> homeProductClickedEvent(
      HomeProductClickedEvent event, Emitter<HomeState> emit) {
    // emit(HomeProductClickedState(productId: event.productId));
  }

}
