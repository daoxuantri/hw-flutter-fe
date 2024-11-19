import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproject/api/products.dart';
import 'package:myproject/model/home/data_respone_home.dart';
import 'package:myproject/model/home/products.dart';


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
      // get home
      Data dataHomes = await ApiServiceProducts().getAllProduct();

      //get children (home) -> all product
      List<ProductDataModel>? products = dataHomes.products;

      //get children (home) -> rating
      List<ProductDataModel>? ratingProducts = dataHomes.ratingProducts;



      emit(HomeLoadedSuccessState(productsPropose: products! , ratingPropose : ratingProducts!));
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
    emit(HomeProductClickedState(productId: event.productId));
  }

}
