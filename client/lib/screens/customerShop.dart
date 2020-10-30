import 'package:client/providers/customer.dart';
import 'package:client/screens/review.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerShop extends StatefulWidget {
  final String shopId;
  CustomerShop({this.shopId});

  @override
  _CustomerShopState createState() => _CustomerShopState();
}

class _CustomerShopState extends State<CustomerShop> {
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      setState(() {
        loading = true;
      });
      await Provider.of<CustomerView>(context, listen: false)
          .getShopById(widget.shopId);

      await Provider.of<CustomerView>(context, listen: false).getProducts(
          Provider.of<CustomerView>(context, listen: false).prodId);

      await Provider.of<CustomerView>(context, listen: false)
          .getShopOwner(widget.shopId);
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    void showAddress() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ), //this right here

              child: Container(
                height: 300,
                width: 300,
                child: Center(
                  child: Text(Provider.of<CustomerView>(context, listen: false)
                      .address),
                ),
              ));
        },
      );
    }

    void takeDetails() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ), //this right here

              child: Container(
                height: 300,
                width: 300,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: name,
                        decoration:
                            InputDecoration(hintText: 'Enter your name'),
                      ),
                      RaisedButton(onPressed: () async {
                        await Provider.of<CustomerView>(context, listen: false)
                            .addCustomer(name.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Review(widget.shopId)));
                      })
                    ],
                  ),
                ),
              ));
        },
      );
    }

    return loading
        ? Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                  Provider.of<CustomerView>(context, listen: false).shopName),
              actions: [
                Row(
                  children: [
                    Text("Phone Number:"),
                    Text(Provider.of<CustomerView>(context, listen: false)
                        .phoneNumber),
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    takeDetails();
                  },
                  child: Text("Give Review"),
                ),
              ],
            ),
            body: ListView.builder(
              itemBuilder: (context, i) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Product Name: "),
                          Text(Provider.of<CustomerView>(context, listen: false)
                              .product[i]
                              .name),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Price:Rs "),
                          Text(
                              (Provider.of<CustomerView>(context, listen: false)
                                      .product[i]
                                      .price)
                                  .toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Quantity: "),
                          Text(
                              (Provider.of<CustomerView>(context, listen: false)
                                      .product[i]
                                      .quantity)
                                  .toString()),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: Provider.of<CustomerView>(context, listen: false)
                  .product
                  .length,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showAddress();
              },
              child: Container(
                  width: 200,
                  height: 200,
                  child: Center(child: Text("Addres"))),
            ),
          );
  }
}
