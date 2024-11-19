import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(EditInitial()) {
    on<EditInitialEvent>(editInitialEvent);
    on<EditErrorScreenToLoginEvent>(editErrorScreenToLoginEvent);
    on<EditProductClickedEvent>(editProductClickedEvent);
  }

  Future<FutureOr<void>> editInitialEvent(
      EditInitialEvent event, Emitter<EditState> emit) async {
    emit(EditLoadingState());
    try {
      emit(EditLoadedSuccessState());
    } catch (e) {
      emit(EditErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> editErrorScreenToLoginEvent(
      EditErrorScreenToLoginEvent event, Emitter<EditState> emit) {
    emit(EditErrorScreenToLoginState());
  }

  FutureOr<void> editProductClickedEvent(
  EditProductClickedEvent event,  Emitter<EditState> emit, ) async {
  try {
    var uri = Uri.parse("http://192.168.2.183:4000/products/createproduct");
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
      print('Thành công: ${responseData}');
      emit(EditUploadedSuccessState());
    } else {
      print('Lỗi: ${response.statusCode}');
    }
  } catch (e) {
     print('Thất bại: $e'); 
    print('Thất bại');
    emit(EditErrorState(errorMessage: e.toString()));
  }
}

}
