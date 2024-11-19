import 'package:myproject/model/products/product_data_model.dart';

class ProductDetailsRespone {
  bool? success;
  String? message;
  List<ProductDataModel>? data;

  ProductDetailsRespone({this.success, this.message, this.data});

  ProductDetailsRespone.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductDataModel>[];
      json['data'].forEach((v) {
        data!.add(new ProductDataModel.fromJson(v));
      });
      
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}