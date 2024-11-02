import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServicesAccount {
  final String _baseUrl = "http://192.168.2.183:4000";

  Future<void> sendOtp(String email) async {
    var url = Uri.parse("$_baseUrl/users/email_verification1/$email");
    var headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    var response = await http.post(url, headers: headers);
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
    }
    else{
      throw Exception(responseData['message']);
    }
  }

  Future<void> resetPassword(String email, String password) async {
  var url = Uri.parse("$_baseUrl/users/resetpass");
  var headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
  };
  var body = jsonEncode({"email": email, "password": password});

  var response = await http.post(url, headers: headers, body: body);

  var responseData = jsonDecode(response.body);
  // var data = AccountResponse.fromJson(responseData);
  if (response.statusCode == 200) {
    if (responseData['success'] == true) {
      // Đã xác thực thành công
    } else {
      throw Exception(responseData['message']);
      
    }
  } else {
    // Lỗi từ server, ném ra ngoại lệ với thông báo lỗi
    throw Exception(responseData['message']);
  }
}

Future<void> checkVerifyOTPforEmail(String email, String code) async {
  var url = Uri.parse("$_baseUrl/users/verify1");
  var headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
  };
  var body = jsonEncode({"email": email, "otp": code});

  var response = await http.post(url, headers: headers, body: body);

  var responseData = jsonDecode(response.body);
  // var data = AccountResponse.fromJson(responseData);
  if (response.statusCode == 200) {
    if (responseData['success'] == true) {
      // Đã xác thực thành công
    } else {
      throw Exception(responseData['message']);
      
    }
  } else {
    // Lỗi từ server, ném ra ngoại lệ với thông báo lỗi
    throw Exception(responseData['message']);
  }
}

  /// id: vendor id
  /// code: otp code
  void confirmEmail(String id, String code) async {
    var url = Uri.parse("$_baseUrl/account/confirm-email/$id/$code");
    var headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    var response = await http.post(url, headers: headers);
  }
}
