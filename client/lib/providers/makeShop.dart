import 'dart:convert';

import 'package:client/screens/makeShop.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Product {
  String name;
  int price;
  String company;
  int quantity;
  String pno;
  Product({this.company, this.name, this.pno, this.price, this.quantity});
}

class NewShop with ChangeNotifier {
  String category;
  String shopName;
  String address;
  int noOfProducts;
  List<dynamic> products = [];
  Future<void> makeShop({
    String address,
    String shopName,
    String token,
    String category,
    int noOfProducts,
  }) async {
    try {
      print("here");
      this.category = category;
      this.shopName = shopName;
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

  Future<bool> getShopInfo(String token) async {
    final response = await http.get(
      'http://10.0.2.2:3000/shop/details',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token
      },
    );
    final responseBody = jsonDecode(response.body);
    address = responseBody['data'][0]['address'];
    category = responseBody['data'][0]['category'];
    shopName = responseBody['data'][0]['shopName'];
    noOfProducts = responseBody['data'][0]['noOfProducts'];
    print(address);
    print(shopName);
    return true;
    print(responseBody);
  }

  Future<void> addProduct(
      {int quantity,
      int price,
      String name,
      String company,
      String token}) async {
    final response = await http.post('http://10.0.2.2:3000/shop/add/products',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token
        },
        body: jsonEncode(<String, dynamic>{
          'quantity': quantity,
          'price': price,
          'name': name,
          'company': company,
        }));
    final responseBody = jsonDecode(response.body);
    print(responseBody);
  }

  Future<void> getProducts(String token) async {
    final response = await http.get(
      'http://10.0.2.2:3000/shop/getProducts',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token
      },
    );
    final responseBody = jsonDecode(response.body);
    List prod = responseBody['data']
        .map((i) => Product(
              pno: i['pno'],
              company: i['company'],
              name: i['name'],
              quantity: i['quantity'],
              price: i['price'],
            ))
        .toList();
    products = prod;
    notifyListeners();
    print(products);
  }
}
