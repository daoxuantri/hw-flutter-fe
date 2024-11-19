class ProductItem {
  String? productId;
  String? name;
  int? quantity;
  String? images;
  int? price;

  ProductItem(
      {this.productId, this.name, this.quantity, this.images, this.price});

  ProductItem.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    quantity = json['quantity'];
    images = json['images'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['images'] = this.images;
    data['price'] = this.price;
    return data;
  }
}