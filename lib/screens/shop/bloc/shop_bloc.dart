import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(ShopInitial()) {
    on<ShopInitialEvent>(shopInitialEvent);
    on<ShopErrorScreenToLoginEvent>(shopErrorScreenToLoginEvent);
    on<ShopProductClickedEvent>(shopProductClickedEvent);
  }

   Future<FutureOr<void>> shopInitialEvent(
      ShopInitialEvent event, Emitter<ShopState> emit) async {
    emit(ShopLoadingState());
    try {
      emit(ShopLoadedSuccessState());
    } catch (e) {
      emit(ShopErrorState(errorMessage: e.toString()));
    }
  }

  // Future<FutureOr<void>> shopInitialEvent(
  //     ShopInitialEvent event, Emitter<ShopState> emit) async {
  //   emit(ShopLoadingState());
  //   try {
      

  //     emit(ShopLoadedSuccessState( ));
  //   } catch (e) {
  //     String failToken = e.toString();
  //     if (failToken.startsWith('Exception: ')) {
  //       failToken = failToken.substring('Exception: '.length);
  //     }
  //     emit(ShopErrorState(errorMessage: failToken));
  //   }
  // }

  FutureOr<void> shopErrorScreenToLoginEvent(
      ShopErrorScreenToLoginEvent event, Emitter<ShopState> emit) {
    emit(ShopErrorScreenToLoginState());
  }

  FutureOr<void> shopProductClickedEvent(
      ShopProductClickedEvent event, Emitter<ShopState> emit) {
    emit(ShopProductClickedState(productId: event.productId));
  }
}