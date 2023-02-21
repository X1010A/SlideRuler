import 'dart:io';
import 'package:flutter/material.dart';

class Controller extends StatelessWidget {
  const Controller({super.key});

  @override
  Widget build(BuildContext context) {
    final socket = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            iconSize: 50,
            padding: const EdgeInsets.all(40),
            onPressed: () {
              print(socket);
              print("up");
            },
            icon: const Icon(Icons.arrow_upward)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          IconButton(
              iconSize: 50,
              onPressed: () {},
              padding: const EdgeInsets.all(40),
              icon: const Icon(Icons.arrow_back_rounded)),
          IconButton(
              iconSize: 50,
              padding: const EdgeInsets.all(40),
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward))
        ]),
        IconButton(
            padding: EdgeInsets.all(40),
            onPressed: () {},
            iconSize: 50,
            icon: const Icon(Icons.arrow_downward),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Colors.black),
              ),
            )),
        SizedBox(
          height: 50,
          child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/connection');
              },
              child: const Text(
                "Desconectar",
                textScaleFactor: 1.5,
              )),
        )
      ],
    ));
  }
}
