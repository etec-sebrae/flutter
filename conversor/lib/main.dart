import 'package:conversor/tela_conversor/conversor.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MaterialApp(
    home: Conversor(),
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white
    ),
  ));
}

