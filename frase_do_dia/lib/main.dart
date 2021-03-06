import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Frase do dia!",
    home: Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
              Text(
                "Lorem Ipsum é simplesmente um texto fictício da indústria tipográfica e de impressão.",
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
      ),
    ),
  ));
}
