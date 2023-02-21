// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:slide_ruler/views/buttons_controller.dart';
import 'package:slide_ruler/views/connection_ip.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/connection',
      routes: {
        '/connection': (context) => Connection(),
        '/controller': (context) => Controller()
      },
      debugShowCheckedModeBanner: false,
      home: Connection(),
    );
  }
}
