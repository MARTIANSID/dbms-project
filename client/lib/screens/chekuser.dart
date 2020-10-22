import 'package:client/screens/allShops.dart';
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

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.red[700], Color(0xff171C33)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.5, 0.5]),
          ),
          alignment: Alignment.center,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Buying And Selling App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
=======
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
              ),
              SizedBox(
                height: size.height * 0.35,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BuyerLogin()),
                    );
                  },
                  child: RaisedButton(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          side: BorderSide.none),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SellerLogin()));
                      },
                      child: Text(
                        "Buyer",
                        style: TextStyle(fontSize: 20, fontFamily: 'Michroma'),
                      ))),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    side: BorderSide.none),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SellerLogin()));
                },
                child: Text(
                  "Seller",
                  style: TextStyle(fontSize: 20, fontFamily: 'Michroma'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
