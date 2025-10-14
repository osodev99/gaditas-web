import 'package:flutter/material.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({super.key});

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  int edad = 23;
  int counter = 0;
  List<String> nombres = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
        actions: [
          IconButton(
            onPressed: () {
              String abc = 'abc';
              setState(() {
                counter++;
                abc = 'def';
              });
              abc = 'abc';
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              counter--;
              setState(() {});
            },
            icon: Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              counter = 0;
              setState(() {});
            },
            icon: Icon(Icons.restore),
          ),
        ],
      ),
      body: Center(
        child: Text('data $counter', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
