import 'dart:io'; 
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; 
import 'dart:convert';

import 'package:myproject/model/orders/data_order_model.dart';
import 'package:myproject/model/orders/respone_list_all_order.dart'; 

  

class ApiServiceOrders {
  static const String baseUrl = 'http://192.168.1.29:4000';

  Future<List<Data>> getAllOrder() async {

    var url = Uri.parse('$baseUrl/orders/getallorder');

    var headers = {
      'accept': 'application/json',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        var response = ResponeListAllOrder.fromJson(responseData);
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

  Future<String> setStatusDelivery(String orderId, bool delivery) async {

    var url = Uri.parse('$baseUrl/orders/setdelivery');

    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    var body = json.encode({
      'orderId': orderId,
      'delivery': delivery
    });

    var response = await http.put(url, headers: headers, body: body);
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      if (responseData['success'] == true) { 
        return responseData['message'];
      } else {
        throw Exception(responseData['message']);
      }
    } else if (response.statusCode == 401) {
      throw Exception('Đang gặp lỗi');
    } else {
      throw Exception('Gọi api thất bại');
    }
  }


//  Future<ProductDataModel> getDetailProduct(String productId) async {
//     // await CheckToken.checkExpireToken();

//     var url = Uri.parse('$baseUrl/products/$productId');
//     // final String? token = await UserSecureStorage.getToken();

//     var headers = {
//       'accept': 'application/json'
//     };

//     var response = await http.get(url, headers: headers);

//     if (response.statusCode == 201) {
//       var responseData = json.decode(response.body);
//       if (responseData['success'] == true) {
//       var response = ProductDetailsRespone.fromJson(responseData);
//       return response.data!.first;
//       } else {
//         throw Exception(responseData['message']);
//       }
//     } else if (response.statusCode == 401) {
//       throw Exception('phiên đăng nhập hết hạn');
//     } else {
//       throw Exception('fail to call api get detail product');
//     }
//   }


//   Future<List<ProductDataModel>> getAllProductShop() async {
//     // await CheckToken.checkExpireToken();

//     var url = Uri.parse('$baseUrl/products/listallproduct'); 
//     var headers = {
//       'accept': 'application/json'
//     };

//     var response = await http.get(url, headers: headers);

//     if (response.statusCode == 200) {
//       var responseData = json.decode(response.body);
//       if (responseData['success'] == true) {
//       var response = ProductDetailsRespone.fromJson(responseData);
//       return response.data!;
//       } else {
//         throw Exception(responseData['message']);
//       }
//     } else if (response.statusCode == 401) {
//       throw Exception('phiên đăng nhập hết hạn');
//     } else {
//       throw Exception('fail to call api get detail product');
//     }
//   }

 
}
