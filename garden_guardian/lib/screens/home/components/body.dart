import 'package:flutter/material.dart';
import 'package:garden_guardian/screens/home/components/content.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/home_background_leafes.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter)
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Your Plants",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 48,
                          fontFamily: 'California FB',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFF5FFF2),
                        ),
                      )),
                  ),
                  Container(
                    height: size.height * 0.75,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5FFF2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Content(),
                    )
                  ),
                ],
              ),
        ],
      )),
    );
  }
}
