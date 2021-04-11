import 'package:client/providers/customer.dart';
import 'package:client/screens/customerShop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllShops extends StatefulWidget {
  @override
  _AllShopsState createState() => _AllShopsState();
}

class _AllShopsState extends State<AllShops> {
  bool isLoading = false;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      setState(() {
        isLoading = true;
      });
      await Provider.of<CustomerView>(context, listen: false).getAllShops();
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ListView.builder(
                    itemCount: Provider.of<CustomerView>(context, listen: false)
                        .shops
                        .length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomerShop(
                                      shopId: Provider.of<CustomerView>(context,
                                              listen: false)
                                          .shops[i]
                                          .shopId)));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 8,
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  Provider.of<CustomerView>(context,
                                          listen: false)
                                      .shops[i]
                                      .shopName,
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.blue),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  Provider.of<CustomerView>(context,
                                          listen: false)
                                      .shops[i]
                                      .address,
                                  style: TextStyle(
                                      color: Colors.indigo, fontSize: 22),
                                ),
                                Text(
                                  Provider.of<CustomerView>(context,
                                          listen: false)
                                      .shops[i]
                                      .category,
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ));
  }
}
