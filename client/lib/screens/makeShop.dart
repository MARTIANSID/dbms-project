import 'package:client/providers/makeShop.dart';
import 'package:client/providers/seller_auth.dart';
import 'package:client/providers/seller_auth.dart';
import 'package:client/screens/products.dart';
import 'package:client/screens/seller_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MakeShop extends StatefulWidget {
  @override
  _MakeShopState createState() => _MakeShopState();
}

final formKey = GlobalKey<FormState>();
TextEditingController address = TextEditingController();
TextEditingController shopName = TextEditingController();
TextEditingController category = TextEditingController();
TextEditingController noOfProducts = TextEditingController();

class _MakeShopState extends State<MakeShop> {
  void makeShop() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ), //this right here

            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: address,
                    decoration: InputDecoration(hintText: 'address'),
                  ),
                  TextFormField(
                    controller: shopName,
                    decoration: InputDecoration(hintText: 'Shop Name'),
                  ),
                  TextFormField(
                    controller: category,
                    decoration: InputDecoration(hintText: 'Category'),
                  ),
                  TextFormField(
                    controller: noOfProducts,
                    decoration: InputDecoration(hintText: 'No Of Products'),
                  ),
                  RaisedButton(onPressed: () async {
                    await Provider.of<NewShop>(context, listen: false).makeShop(
                        shopName: shopName.text,
                        address: address.text,
                        category: category.text,
                        noOfProducts: int.parse(noOfProducts.text),
                        token: Provider.of<SellerLoginn>(context, listen: false)
                            .token);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Products()));
                  })
                ],
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RaisedButton(
        onPressed: () {
          makeShop();
        },
        child: Text('Make Shop'),
      )),
    );
  }
}
