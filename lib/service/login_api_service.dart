import 'dart:io';
import 'package:bitcoin_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginApiService {
  LoginApiService._();
  static final LoginApiService _loginApiService = LoginApiService._();
  factory LoginApiService() => _loginApiService;
  Future<int> getLoginApiService({required Map map}) async {
    Response response =
        await http.post(Uri.parse(AppConst.authLoginURL), body: map);

    if (response.statusCode == 200) {
      return response.statusCode;
    } else if (response.statusCode == 201) {
      throw const HttpException('Error Code: 201');
    } else if (response.statusCode == 400 || response.statusCode == 404) {
      throw const HttpException('Error Code: 400');
    } else {
      throw const HttpException('Something went wrong');
    }
  }
}
