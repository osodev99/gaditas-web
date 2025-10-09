import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            FlutterLogo(size: 150),
            Text(
              'BIENVENIDO AL CURSO DE ',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
            Text(
              'FLUTTER',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                fontStyle: FontStyle.italic,
                // color: Colors.red,
              ),
            ),
          ],
        ),
        appBar: AppBar(title: Text('App bar')),
      ),
    );
  }
}
