import 'dart:async'; 
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart'; 
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileInitialEvent>(profileInitialEvent);
  }

  Future<void> profileInitialEvent(
      ProfileInitialEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    try {
      // final apiService = ApiServiceProfile();
      // ProfileDataModel profile = await apiService.getProfile(event.userId);
      emit(ProfileLoadedSuccessState());
    } catch (e) {
      emit(ProfileErrorState(errorMessage: e.toString()));
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
