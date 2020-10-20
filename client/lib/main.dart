import 'package:client/providers/makeShop.dart';
import 'package:client/providers/seller_auth.dart';
import 'package:client/screens/chekuser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: SellerLoginn()),
          ChangeNotifierProvider.value(value: NewShop())
        ],
        child: MaterialApp(
            routes: {'/logout': (context) => CheckUser()},
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: CheckUser()));
  }
}
