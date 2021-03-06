import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aluno',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aluno ETEC'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}