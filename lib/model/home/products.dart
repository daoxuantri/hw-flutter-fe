class ProductDataModel {
  String? sId;
  String? name;
  String? images;
  String? description;
  int? price;
  int? rating;
  int? sold;

  ProductDataModel(
      {this.sId,
      this.name,
      this.images,
      this.description,
      this.price,
      this.rating,
      this.sold});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'];
    description = json['description'];
    price = json['price'];
    rating = json['rating'];
    sold = json['sold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['images'] = this.images;
    data['description'] = this.description;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['sold'] = this.sold;
    return data;
  }
}