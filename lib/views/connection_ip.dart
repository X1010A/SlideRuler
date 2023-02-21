// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Connection extends StatelessWidget {
  const Connection({super.key});
  final String _ip = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: TextField(
            keyboardType: TextInputType.number,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Dirección IP",
            ),
          ),
        ),
        SizedBox(height: 50),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: TextField(
            keyboardType: TextInputType.number,
            obscureText: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Puerto"),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/controller');
              },
              child: Text(
                "Conectar",
                textScaleFactor: 1.5,
              )),
        )
      ],
    ));
  }
}
