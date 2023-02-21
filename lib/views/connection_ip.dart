import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class Connection extends StatefulWidget {
  const Connection({super.key});

  @override
  State<Connection> createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  Socket? socket;
  String? ip;
  String? message;
  final keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: keyForm,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Direccion IP:",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "LLene esta linea";
                  }
                },
                onSaved: (value) {
                  ip = value;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showSecondPage(context);
              },
              child: const Text('Conectar'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSecondPage(BuildContext context) {
    if (keyForm.currentState!.validate()) {
      keyForm.currentState?.save();
      conectar();
      print(ip);
      Navigator.of(context).pushNamed('/controller', arguments: socket);
    }
  }

  void conectar() async {
    try {
      socket = await Socket.connect('192.168.1.3', 1782);
      print(
          'Conectado al servidor ${socket!.remoteAddress}:${socket!.remotePort}');
      setState(() {
        message =
            'Conectado al servidor ${socket!.remoteAddress}:${socket!.remotePort}';
      });
      socket!.write('¡Hola, servidor!\n');
      socket!.listen((data) {
        final serverMessage = utf8.decode(data);
        print('Mensaje recibido del servidor: $serverMessage');
        setState(() {
          message = serverMessage;
        });
      }, onDone: () {
        print('Desconectado del servidor');
        setState(() {
          message = 'Desconectado del servidor';
        });
      });
    } catch (e) {
      print(e);
      setState(() {
        message = 'Error al conectar al servidor';
      });
    }
  }
}
