import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/detail_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  bool isActive = false;
  bool isHidePass = true;

  final userController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    log('===> Entrando al build');
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 34),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            spacing: 12,
            children: [
              FlutterLogo(size: 150),

              TextFormField(
                controller: userController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  icon: Icon(Icons.email_outlined),
                  // prefixIcon: Icon(Icons.person_outline),
                  // suffixIcon: Icon(Icons.visibility),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
                // obscureText: false,
              ),

              TextFormField(
                controller: passController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  icon: Icon(Icons.lock_outline),
                  // prefixIcon: Icon(Icons.person_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isHidePass ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      isHidePass = !isHidePass;
                      setState(() {});
                    },
                  ),
                ),
                obscureText: isHidePass,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es obligatorio y secreto';
                  }
                  return null;
                },
              ),

              CheckboxListTile(
                value: isChecked,
                onChanged: (bool? value) {
                  isChecked = value ?? false;
                  setState(() {});
                },
                title: Text('Deseas mantener tu sesion abierta?'),
                controlAffinity: ListTileControlAffinity.leading,
              ),

              FilledButton(
                onPressed: () {
                  final username = userController.text;
                  final password = passController.text;
                  if (formKey.currentState!.validate()) {
                    if (username.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Datos faltante')));
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(args: '20'),
                        ),
                      );
                    }
                  }
                },
                child: Text('INGRESAR'),
              ),

              // SwitchListTile(
              //   value: isActive,
              //   onChanged: (bool value) {
              //     isActive = value;
              //     setState(() {});
              //   },
              //   title: Text('Ejemplo switch'),
              //   controlAffinity: ListTileControlAffinity.leading,
              // ),
              // Icon(
              //   isChecked ? Icons.favorite : Icons.favorite_border,
              //   color: isChecked ? Colors.red : Colors.black,
              //   size: 80,
              // ),
              // MyWidget(text: '$isActive'),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    log('===> Entrando a my widget');
    return Text(text);
  }
}
