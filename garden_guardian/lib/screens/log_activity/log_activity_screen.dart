import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogActivity extends StatefulWidget {
  final int? plantId;

  const LogActivity({
    Key? key,
    required this.plantId,
  }) : super(key: key);

  @override
  State<LogActivity> createState() => _LogActivityState();
}

class _LogActivityState extends State<LogActivity> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      left: 20.0, top: 20.0, right: 20.0, bottom: 25.0),
                  child: Text("Log Watering",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'California FB',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF282B27),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: logWatering,
                    child: const Text("Log Watering"),
                  ),
                ),
              ],
            )));
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
        ));
  }

  void logWatering() async {
    print(DateTime.now());

    Navigator.pop(context);
  }
}
