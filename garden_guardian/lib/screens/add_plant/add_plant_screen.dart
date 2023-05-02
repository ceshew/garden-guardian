import 'package:flutter/material.dart';

import 'components/body.dart';

class AddPlant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FFF2),
      appBar: buildAppBar(context),
      body: Body()
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        )
    );
  }
}
