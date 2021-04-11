import 'package:client/providers/seller_auth.dart';
import 'package:client/screens/makeShop.dart';
import 'package:client/screens/products.dart';
import 'package:client/screens/sellerPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerLogin extends StatefulWidget {
  @override
  _SellerLoginState createState() => _SellerLoginState();
}

class _SellerLoginState extends State<SellerLogin> {
  bool signUp = false;
  bool registered = false;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: formKey,
            child: Center(
              child: Container(
                width: 200,
                height: 500,
                child: Column(
                  children: [
                    TextFormField(
                      controller: phoneNumber,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                      ),
                    ),
                    if (registered)
                      TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            hintText: ' Password',
                          )),
                    if (signUp)
                      TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                            hintText: 'username',
                          )),
                    if (signUp)
                      TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            hintText: 'password',
                          )),
                    // if (signUp) TextFormField(),
                    if (!registered && !signUp)
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        color: Colors.black,
                        onPressed: () async {
                          print(phoneNumber.text);
                          registered = await Provider.of<SellerLoginn>(context,
                                  listen: false)
                              .checkIfRegistered(phoneNumber.text);
                          print(registered);
                          if (registered) {
                            setState(() {
                              signUp = false;
                            });
                          } else {
                            setState(() {
                              signUp = true;
                            });
                          }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    if (registered)
                      RaisedButton(
                        onPressed: () async {
                          bool login = false;
                          login = await Provider.of<SellerLoginn>(context,
                                  listen: false)
                              .signIn(
                                  password: password.text,
                                  number: phoneNumber.text);

                          if (login) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Products()));
                          }
                        },
                        child: Text("Signin"),
                      ),
                    if (signUp)
                      RaisedButton(
                        onPressed: () async {
                          bool signin = false;
                          signin = await Provider.of<SellerLoginn>(context,
                                  listen: false)
                              .signUp(
                                  password: password.text,
                                  number: phoneNumber.text,
                                  username: username.text);
                          if (signin) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MakeShop()));
                          }
                        },
                        child: Text("SignUp"),
                      )
                  ],
                ),
              ),
            )));
  }
}
