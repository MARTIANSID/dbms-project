import 'package:client/providers/customer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllShops extends StatefulWidget {
  @override
  _AllShopsState createState() => _AllShopsState();
}

class _AllShopsState extends State<AllShops> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await Provider.of<CustomerView>(context, listen: false).getAllShops();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('All Shops')));
  }
}
