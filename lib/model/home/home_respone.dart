import 'package:myproject/model/home/data_respone_home.dart';

class HomeRespone {
  bool? success;
  String? message;
  Data? data;
  HomeRespone({this.success, this.message, this.data});

  HomeRespone.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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