import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/responsive_screen.dart';
import 'package:flutter_application_1/ui/state_screen.dart';

import 'ui/detail_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: StateScreen());
  }
}
