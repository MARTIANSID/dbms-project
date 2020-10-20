import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SellerLoginn with ChangeNotifier {
  String token;
  String phoneNumber;
  String username;

  Future<bool> checkIfRegistered(String number) async {
    try {
      print("here");
      print(number);
      final response = await http.post('http://10.0.2.2:3000/seller/phone',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'phoneNumber': number,
          }));

      final responseBody = jsonDecode(response.body);

      // print('PP checkIfRegistered response: $responseBody');
      print(responseBody['isRegistered']);
      return responseBody['isRegistered'];
    } catch (err) {
      print(err);
    }
  }

  Future<bool> signIn({String number, String password}) async {
    final response = await http.post('http://10.0.2.2:3000/seller/login',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'phoneNumber': number, 'password': password}));
    final responseBody = jsonDecode(response.body);
    print(responseBody);
    username = responseBody['user']['username'];
    token = responseBody['token'];
    return responseBody['authenticated'];
  }

  Future<bool> signUp({String number, String password, String username}) async {
    final response = await http.post('http://10.0.2.2:3000/seller/signUp',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'phoneNumber': number,
          'password': password,
          'username': username
        }));
    final responseBody = jsonDecode(response.body);
    print(responseBody);
    username = responseBody['user']['username'];
    token = responseBody['token'];
    return responseBody['authenticated'];
  }
}
