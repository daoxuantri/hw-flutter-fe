import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproject/api/order.dart';
import 'package:myproject/model/orders/data_order_model.dart';
part 'view_event.dart';
part 'view_state.dart';

class ViewBloc extends Bloc<ViewEvent, ViewState> {
  ViewBloc() : super(ViewInitial()) {
    on<ViewInitialEvent>(viewInitialEvent);
    on<ViewErrorScreenToLoginEvent>(viewErrorScreenToLoginEvent);
    on<ViewProductClickedEvent>(viewProductClickedEvent);
  }

  Future<FutureOr<void>> viewInitialEvent(
      ViewInitialEvent event, Emitter<ViewState> emit) async {
    emit(ViewLoadingState());
    try {
      final apiService = ApiServiceOrders();
      List<Data>? listorder = await apiService.getAllOrder();
      emit(ViewLoadedSuccessState(listorder: listorder));
    } catch (e) {
      emit(ViewErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> viewErrorScreenToLoginEvent(
      ViewErrorScreenToLoginEvent event, Emitter<ViewState> emit) {
    emit(ViewErrorScreenToLoginState());
  }

  FutureOr<void> viewProductClickedEvent(
      ViewProductClickedEvent event, Emitter<ViewState> emit) async {
    try {
      
    } catch (e) {
      emit(ViewErrorState(errorMessage: e.toString()));
    }
  }
}
