import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases =  [
    "Frase 1",
    "Frase 2",
    "Frase 3",
    "Frase 4",
    "Frase 5",
    "Frase 6" ];

  var _fraseGerada = "Clique abaixo para gerar uma frase";

  void gerarFrase(){
    var numeroSoteado = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[numeroSoteado];
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration:
          BoxDecoration(border: Border.all(width: 3, color: Colors.amber)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png"),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
              ),
              RaisedButton(
                child: Text(
                    "Nova Frase",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )),
                color: Colors.green,
                onPressed: gerarFrase,
              )
            ],
          ),
        ),
      )
    );
  }
}
