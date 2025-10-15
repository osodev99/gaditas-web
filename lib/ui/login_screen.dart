import 'dart:developer';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FlutterLogo(size: 150),
          CheckboxListTile(
            value: isChecked,
            onChanged: (bool? value) {
              isChecked = value ?? false;
              setState(() {});
            },
            title: Text('Deseas mantener tu sesion abierta?'),
            controlAffinity: ListTileControlAffinity.leading,
          ),

          SwitchListTile(
            value: isActive,
            onChanged: (bool value) {
              isActive = value;
              setState(() {});
            },
            title: Text('Ejemplo switch'),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
    );
  }
}
