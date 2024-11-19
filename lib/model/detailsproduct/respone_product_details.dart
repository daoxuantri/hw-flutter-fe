import 'package:myproject/model/detailsproduct/products_data_model.dart';

class ReponseProductDetails {
  bool? success;
  String? message;
  ProductDataModels? data;

  ReponseProductDetails({this.success, this.message, this.data});

  ReponseProductDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new ProductDataModels.fromJson(json['data']) : null;
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