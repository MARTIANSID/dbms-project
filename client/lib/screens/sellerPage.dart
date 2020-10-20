import 'package:client/providers/seller_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerPage extends StatefulWidget {
  @override
  _SellerPageState createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Authenticated"),
      ),
    );
  }
}
