import 'package:myproject/model/orders/product_item_model.dart';

class Data {
  String? sId;
  String? email;
  String? iduser;
  List<ProductItem>? productItem;
  int? total;
  String? address;
  String? phone;
  bool? delivery;
  int? setCoupon;

  Data(
      {this.sId,
      this.email,
      this.iduser,
      this.productItem,
      this.total,
      this.address,
      this.phone,
      this.delivery,
      this.setCoupon});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    iduser = json['iduser'];
    if (json['productItem'] != null) {
      productItem = <ProductItem>[];
      json['productItem'].forEach((v) {
        productItem!.add(new ProductItem.fromJson(v));
      });
    }
    total = json['total'];
    address = json['address'];
    phone = json['phone'];
    delivery = json['delivery'];
    setCoupon = json['setCoupon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['iduser'] = this.iduser;
    if (this.productItem != null) {
      data['productItem'] = this.productItem!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['delivery'] = this.delivery;
    data['setCoupon'] = this.setCoupon;
    return data;
  }
}