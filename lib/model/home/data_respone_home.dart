

import 'package:myproject/model/home/products.dart';

class Data {
  List<ProductDataModel>? products;
  List<ProductDataModel>? ratingProducts;

  Data({this.products, this.ratingProducts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductDataModel>[];
      json['products'].forEach((v) {
        products!.add(new ProductDataModel.fromJson(v));
      });
    }

    if (json['rating'] != null) {
      ratingProducts = <ProductDataModel>[];
      json['rating'].forEach((v) {
        ratingProducts!.add(new ProductDataModel.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.ratingProducts != null) {
      data['rating'] = this.ratingProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}