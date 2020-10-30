import 'package:client/screens/allShops.dart';
// import 'package:client/screens/buyer_login.dart';
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
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Container(
            height: 250,
            child: Column(
              children: [
                Text(
                  "Buying And Selling App",
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AllShops()));
                    },
                    child: Text(
                      "Buyer",
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SellerLogin()));
                  },
                  child: Text(
                    "Seller",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
