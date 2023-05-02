import 'package:flutter/material.dart';
import 'package:garden_guardian/screens/add_plant/components/form_widget.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0, bottom: 25.0),
              child: Text(
                "Register a New Plant",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: 'California FB',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF282B27),
                )
              ),
            ),
            Divider(
              height: 20,
              thickness: 1,
              indent: 15,
              endIndent: 15,
              color: Color(0xFFC1C9BF),
            ),
            Padding(
              padding: EdgeInsets.all(15.0), 
              child: FormWidget()
            ),
        ],  
      ),
    ));
  }
}
