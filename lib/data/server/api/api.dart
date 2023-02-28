// ignore_for_file: depend_on_referenced_packages, empty_catches

import 'package:dio/dio.dart';

class AuthenticationApiCall {
  static late Dio dio;

  static void authenticationInit() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Map<String, dynamic>> postLoginData({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {}
    return {};
  }


  static Future<Map<String, dynamic>> postRegisterData({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final response = await dio.post(
        'register?',
        queryParameters: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        }
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print(e);
    }
    return {};
  }
}

void main(List<String> args) async {
  AuthenticationApiCall.authenticationInit();
  final result = await AuthenticationApiCall.postRegisterData(
    email: "bertold@gmail.com",
    password: "walid12",
    name: "bertoldaot",
    phone: "212650221",
  );
  print(result);
}
