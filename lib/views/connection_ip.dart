import 'dart:convert';
import 'dart:io';
import 'dart:core';
import 'package:flutter/material.dart';
import 'buttons_controller.dart';

class Connection extends StatefulWidget {
  const Connection({super.key});

  @override
  State<Connection> createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  late Socket socket;
  late String ip;
  late String message = "";
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
                  // ignore: unnecessary_new
                  RegExp exp = new RegExp(
                      r"^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$");
                  ip = value!;
                  bool isValid = exp.hasMatch(ip);
                  if (ip.isEmpty) {
                    return "LLene esta linea";
                  } else if (!isValid) {
                    return "Ej: IP: 192.168.1.10";
                  }
                  return null;
                },
                onSaved: (value) {
                  ip = value!;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showSecondPage(context);
              },
              child: const Text('Conectar'),
            ),
            Text(
              message,
            ),
          ],
        ),
      ),
    );
  }

  void _showSecondPage(BuildContext context) {
    if (keyForm.currentState!.validate()) {
      keyForm.currentState?.save();
      conectar(context);
      setState(() {
        message = "Servidor Apagado o Ip Incorrecta";
      });
    }
  }

  void conectar(BuildContext dialogContext) async {
    try {
      socket = await Socket.connect(ip, 1782);
      print(
          'Conectado al servidor ${socket.remoteAddress}:${socket.remotePort}');
      setState(() {
        message =
            'Conectado al servidor ${socket.remoteAddress}:${socket.remotePort}';
      });
      socket.write('Hola servidor');
      socket.listen((data) {
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
      final route = MaterialPageRoute(builder: (BuildContext dialogContext) {
        return Controller(servidor: socket);
      });
      Navigator.of(dialogContext).push(route);
    } catch (e) {
      setState(() {
        message = 'Error al conectar al servidor';
      });
    }
  }
}
