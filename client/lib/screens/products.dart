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
  void initState() {
    Future.delayed(Duration.zero, () async {
      setState(() {
        isLoading = true;
      });
      await Provider.of<NewShop>(context, listen: false)
          .getProducts(Provider.of<SellerLoginn>(context, listen: false).token);
    });
    setState(() {
      isLoading = false;
    });
  }
// @override

  @override
  Widget build(BuildContext context) {
    TextEditingController productName = TextEditingController();
    TextEditingController price = TextEditingController();
    TextEditingController quantity = TextEditingController();
    TextEditingController company = TextEditingController();
    void takeProduct() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ), //this right here

            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: productName,
                    decoration: InputDecoration(hintText: 'Product Name'),
                  ),
                  TextFormField(
                    controller: price,
                    decoration: InputDecoration(hintText: 'Price'),
                  ),
                  TextFormField(
                    controller: quantity,
                    decoration: InputDecoration(hintText: 'Quantity'),
                  ),
                  TextFormField(
                    controller: company,
                    decoration: InputDecoration(hintText: 'Company'),
                  ),
                  RaisedButton(onPressed: () async {
                    await Provider.of<NewShop>(context, listen: false)
                        .addProduct(
                            company: company.text,
                            name: productName.text,
                            price: int.parse(price.text),
                            quantity: int.parse(quantity.text),
                            token: Provider.of<SellerLoginn>(context,
                                    listen: false)
                                .token);
                    await Provider.of<NewShop>(context, listen: false)
                        .getProducts(
                            Provider.of<SellerLoginn>(context, listen: false)
                                .token);
                  })
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.popAndPushNamed(context, '/logout');
            },
            child: Icon(Icons.logout),
          )
        ],
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return Card( 
                    elevation: 4,
                    child: Container(
                      child: Text(Provider.of<NewShop>(context, listen: true)
                          .products[i]
                          .name),
                    ),
                  );
                },
                itemCount:
                    Provider.of<NewShop>(context, listen: true).products.length,
              ),
            );
          }
        },
        future: Provider.of<NewShop>(context, listen: false).getShopInfo(
            Provider.of<SellerLoginn>(context, listen: false).token),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          takeProduct();
        },
      ),
    );
  }
}
