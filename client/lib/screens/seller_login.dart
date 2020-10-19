import 'package:flutter/material.dart';

class SellerLogin extends StatefulWidget {
  @override
  _SellerLoginState createState() => _SellerLoginState();
}

class _SellerLoginState extends State<SellerLogin> {
  final signUp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            child: Center(
      child: Container(
        width: 200,
        height: 500,
        child: Column(
          children: [
            TextFormField(),
            TextFormField(),
          ],
        ),
      ),
    )));
  }
}
