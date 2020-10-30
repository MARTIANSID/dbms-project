import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Shop {
  String shopId;
  String shopName;
  String address;
  String category;
  int noOfproducts;
  Shop(
      {this.shopName,
      this.address,
      this.category,
      this.noOfproducts,
      this.shopId});
}

class Product {
  String name;
  int price;
  String company;
  int quantity;
  String pno;
  Product({this.company, this.name, this.pno, this.price, this.quantity});
}

class CustomerView with ChangeNotifier {
  String phoneNumber;
  List<dynamic> shops = [];
  String prodId;
  String shopName;
  String address;
  int noOfProducts;
  String category;
  List<dynamic> product = [];
  String cid;
  List<dynamic> comments = [];

  Future<void> getAllShops() async {
    final response = await http.get(
      'http://10.0.2.2:3000/shops/all',
    );
    final responseBody = jsonDecode(response.body);
    print(responseBody);
    List shop = responseBody['data']
        .map(
          (i) => Shop(
              shopName: i['shopName'],
              address: i['address'],
              category: i['category'],
              noOfproducts: i['noOfProducts'],
              shopId: i['shopId']),
        )
        .toList();
    shops = shop;
  }

  Future<void> getShopById(String id) async {
    final response = await http.post('http://10.0.2.2:3000/shop/id',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'shopId': id}));
    final responseBody = jsonDecode(response.body);
    prodId = responseBody['data'][0]['prodId'];
    shopName = responseBody['data'][0]['shopName'];
    address = responseBody['data'][0]['address'];
    category = responseBody['data'][0]['category'];
    noOfProducts = responseBody['data'][0]['noOfProducts'];

    print(responseBody);
  }

  Future<void> getProducts(String prodId) async {
    final response = await http.post('http://10.0.2.2:3000/product',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'prodId': prodId}));
    final responseBody = jsonDecode(response.body);
    List pro = responseBody['data']
        .map((i) => Product(
              pno: i['pno'],
              company: i['company'],
              name: i['name'],
              quantity: i['quantity'],
              price: i['price'],
            ))
        .toList();
    product = pro;
  }

  Future<void> getShopOwner(String id) async {
    final response = await http.post('http://10.0.2.2:3000/shopOwner',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'shopId': id}));
    final responseBody = jsonDecode(response.body);
    phoneNumber = responseBody['data'][0]['phone'];

    print(responseBody);
  }

  Future<void> addCustomer(String name) async {
    final response = await http.post('http://10.0.2.2:3000/add/customer',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'name': name}));
    final responseBody = jsonDecode(response.body);
    cid = responseBody['cid'];

    print(responseBody);
  }

  Future<void> getRevs(String shopId) async {
    final response = await http.post('http://10.0.2.2:3000/comments',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'shopId': shopId}));
    final responseBody = jsonDecode(response.body);
    List y = responseBody['data'].map((i) => i['comment']).toList();
    comments = y;
    notifyListeners();
  }

  Future<void> addComment({String comment, String cid, String shopId}) async {
    final response = await http.post('http://10.0.2.2:3000/add/comment',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'shopId': shopId,
          'cid': cid,
          'comment': comment
        }));
    final responseBody = jsonDecode(response.body);
    print(responseBody);
  }
}
