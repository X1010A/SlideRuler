import 'package:flutter/material.dart';
import 'package:slide_ruler/views/connection_ip.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const Connection(),
        /* '/controller': (BuildContext context) => const Controller(
              servidor: null,
            ), */
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
