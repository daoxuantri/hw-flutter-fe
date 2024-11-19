class UploadProductDataModel {
  String? name;
  String? images;
  String? description;
  int? price;

  UploadProductDataModel(
      {
      this.name,
      this.images,
      this.description,
      this.price,});

  UploadProductDataModel.fromJson(Map<String, dynamic> json) {
   
    name = json['name'];
    images = json['images'];
    description = json['description'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['images'] = this.images;
    data['description'] = this.description;
    data['price'] = this.price;
    return data;
  }
}