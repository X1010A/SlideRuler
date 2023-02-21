import 'package:flutter/material.dart';

class Controller extends StatelessWidget {
  const Controller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            iconSize: 100,
            padding: EdgeInsets.all(80),
            onPressed: () {},
            icon: Icon(Icons.arrow_upward)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          IconButton(
              iconSize: 100,
              onPressed: () {},
              padding: EdgeInsets.all(80),
              icon: Icon(Icons.arrow_back_rounded)),
          IconButton(
              iconSize: 100,
              padding: EdgeInsets.all(80),
              onPressed: () {},
              icon: Icon(Icons.arrow_forward))
        ]),
        IconButton(
            padding: EdgeInsets.all(80),
            onPressed: () {},
            iconSize: 100,
            icon: Icon(Icons.arrow_downward),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
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
              child: Text(
                "Desconectar",
                textScaleFactor: 1.5,
              )),
        )
      ],
    ));
  }
}
