import 'package:client/screens/buyer_login.dart';
import 'package:client/screens/seller_login.dart';
import 'package:flutter/material.dart';

class CheckUser extends StatefulWidget {
  @override
  _CheckUserState createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuyerLogin()),
                  );
                },
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SellerLogin()));
                    },
                    child: Text("Buyer"))),
            Text("Seller")
          ],
        ),
      ),
    );
  }
}
