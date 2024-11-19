import 'dart:io'; 
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:myproject/model/home/data_respone_home.dart';
import 'dart:convert';

import 'package:myproject/model/home/home_respone.dart';
import 'package:myproject/model/products/get_product_details_respone.dart';
import 'package:myproject/model/products/product_data_model.dart';
import 'package:myproject/model/shop/uploadproduct/create_product_response.dart';
import 'package:myproject/model/shop/uploadproduct/upload_products.dart';

  

class ApiServiceProducts {
  static const String baseUrl = 'http://192.168.2.183:4000';

  Future<Data> getAllProduct() async {

    var url = Uri.parse('$baseUrl/products/homeflutter');

    var headers = {
      'accept': 'application/json',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        var response = HomeRespone.fromJson(responseData);
        return response.data!;
      } else {
        throw Exception(responseData['message']);
      }
    } else if (response.statusCode == 401) {
      throw Exception('Đang gặp lỗi');
    } else {
      throw Exception('Gọi api thất bại');
    }
  }


 Future<ProductDataModel> getDetailProduct(String productId) async {
    // await CheckToken.checkExpireToken();

    var url = Uri.parse('$baseUrl/products/$productId');
    // final String? token = await UserSecureStorage.getToken();

    var headers = {
      'accept': 'application/json'
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 201) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
      var response = ProductDetailsRespone.fromJson(responseData);
      return response.data!.first;
      } else {
        throw Exception(responseData['message']);
      }
    } else if (response.statusCode == 401) {
      throw Exception('phiên đăng nhập hết hạn');
    } else {
      throw Exception('fail to call api get detail product');
    }
  }


  Future<List<ProductDataModel>> getAllProductShop() async {
    // await CheckToken.checkExpireToken();

    var url = Uri.parse('$baseUrl/products/listallproduct'); 
    var headers = {
      'accept': 'application/json'
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
      var response = ProductDetailsRespone.fromJson(responseData);
      return response.data!;
      } else {
        throw Exception(responseData['message']);
      }
    } else if (response.statusCode == 401) {
      throw Exception('phiên đăng nhập hết hạn');
    } else {
      throw Exception('fail to call api get detail product');
    }
  }

 
}
