import 'package:myproject/model/shop/uploadproduct/upload_products.dart'; 
class CreateProductResponse {
  bool? success; 
  String? message;
  UploadProductDataModel? data;

  CreateProductResponse({this.success , this.message, this.data});

  CreateProductResponse.fromJson(Map<String, dynamic> json) {
    success = json['success']; 
    message = json['message'];
    data = json['data'] != null ? new UploadProductDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}