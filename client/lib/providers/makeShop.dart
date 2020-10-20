import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NewShop with ChangeNotifier {
  Future<void> makeShop({
    String address,
    String shopName,
    String token,
    String category,
    int noOfProducts,
  }) async {
    try {
      print("here");
      // print(number);
      final response = await http.post('http://10.0.2.2:3000/shop/make',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + token
          },
          body: jsonEncode(<String, dynamic>{
            'address': address,
            'shopName': shopName,
            'category': category,
            'noOfProducts': noOfProducts,
          }));
      print('here');

      final responseBody = jsonDecode(response.body);
      print(responseBody);

      // print('PP checkIfRegistered response: $responseBody');

      // return responseBody['isRegistered'];
    } catch (err) {
      print(err);
    }
  }
}
