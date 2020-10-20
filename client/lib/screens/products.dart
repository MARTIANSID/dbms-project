import 'package:client/providers/makeShop.dart';
import 'package:client/providers/seller_auth.dart';
import 'package:client/screens/makeShop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool isLoading = false;
  @override
  // void initState() {
  //   Future.delayed(Duration.zero, () async {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     await Provider.of<NewShop>(context, listen: false)
  //         .getShopInfo(Provider.of<SellerLoginn>(context, listen: false).token);
  //   });
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              child: Center(
                  child: Column(
                children: [
                  Text(Provider.of<NewShop>(context, listen: false).shopName),
                  Text(Provider.of<NewShop>(context, listen: false).address)
                ],
              )),
            );
          }
        },
        future: Provider.of<NewShop>(context, listen: false).getShopInfo(
            Provider.of<SellerLoginn>(context, listen: false).token),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
