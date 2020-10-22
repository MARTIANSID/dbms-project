import 'package:client/providers/customer.dart';
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
            : ListView.builder(
                itemCount: Provider.of<CustomerView>(context, listen: false)
                    .shops
                    .length,
                itemBuilder: (context, i) {
                  return Card(
                    child: Container(
                      child: Column(
                        children: [
                          Text(Provider.of<CustomerView>(context, listen: false)
                              .shops[i]
                              .shopName),
                          Text(Provider.of<CustomerView>(context, listen: false)
                              .shops[i]
                              .address),
                          Text(Provider.of<CustomerView>(context, listen: false)
                              .shops[i]
                              .category)
                        ],
                      ),
                    ),
                  );
                }));
  }
}
