import 'package:client/screens/allShops.dart';
// import 'package:client/screens/buyer_login.dart';
import 'package:client/screens/seller_login.dart';
import 'package:flutter/material.dart';

class CheckUser extends StatefulWidget {
  @override
  _CheckUserState createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: CustomPaint(
          painter: MyPainter(),
          child: Center(
            child: Container(
              height: 250,
              child: Column(
                children: [
                  Text(
                    "Buying And Selling App",
                    style: TextStyle(fontSize: 35),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    child: RaisedButton(
                        splashColor: Colors.white,
                        color: Colors.black,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllShops()));
                        },
                        child: Text(
                          "Buyer",
                          style: TextStyle(fontSize: 21, color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    child: RaisedButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SellerLogin(),
                          ),
                        );
                      },
                      child: Text(
                        "Seller",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint sastaDesign = Paint()..color = Colors.amber;

    Paint sidBhaagGaya = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.blue[200],
          Colors.blue,
        ],
      ).createShader(Rect.fromCircle(
        center: Offset(0, 0),
        radius: 400,
      ));

    Path myPath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height / 2.5)
      ..quadraticBezierTo(
          size.width / 4, size.height / 4, size.width / 2, size.height / 2.5)
      ..quadraticBezierTo(size.width / 4 + size.width / 2, size.height / 4,
          size.width, size.height / 2.5)
      ..lineTo(size.width, size.height / 2.5)
      ..lineTo(size.width, 0);

    canvas.drawPath(myPath, sidBhaagGaya);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//  ..shader = LinearGradient(colors: [Colors.red]).createShader(Rect.fromPoints(Offset(0,0), Offset(size.width,size.height/2.5));
