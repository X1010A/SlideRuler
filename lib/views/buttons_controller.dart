import 'dart:io';
import 'package:flutter/material.dart';

class Controller extends StatefulWidget {
  const Controller({super.key, required this.servidor});

  final Socket servidor;

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          IconButton(
              iconSize: 50,
              padding: const EdgeInsets.all(40),
              onPressed: () {
                widget.servidor.write('up');
              },
              icon: const Icon(Icons.arrow_upward)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            IconButton(
                iconSize: 50,
                onPressed: () {
                  widget.servidor.write('left');
                },
                padding: const EdgeInsets.all(40),
                icon: const Icon(Icons.arrow_back_rounded)),
            IconButton(
                iconSize: 50,
                padding: const EdgeInsets.all(40),
                onPressed: () {
                  widget.servidor.write('rigth');
                },
                icon: const Icon(Icons.arrow_forward))
          ]),
          IconButton(
              padding: const EdgeInsets.all(40),
              onPressed: () {
                widget.servidor.write('down');
              },
              iconSize: 50,
              icon: const Icon(Icons.arrow_downward),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide(color: Colors.black),
                ),
              )),
          ElevatedButton(
            onPressed: () {
              widget.servidor.close();
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Desconectar'),
          ),
        ],
      ),
    );
  }
}
