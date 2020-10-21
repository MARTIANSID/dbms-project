import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Shop {
  String shopName;
  String address;
  String category;
  int noOfproducts;
  Shop({this.shopName, this.address, this.category, this.noOfproducts});
}

class CustomerView with ChangeNotifier {
  List<dynamic> shops = [];
  Future<void> getAllShops() async {
    final response = await http.get(
      'http://10.0.2.2:3000/shops/all',
    );
    final responseBody = jsonDecode(response.body);
    print(responseBody);
    List shop = responseBody['data']
        .map((i) => Shop(
            shopName: i['shopName'],
            address: i['address'],
            category: i['category'],
            noOfproducts: i['noOfProducts']))
        .toList();
    shops = shop;
  }
}
