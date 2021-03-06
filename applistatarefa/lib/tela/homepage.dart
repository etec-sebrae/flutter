import 'package:applistatarefa/tela/telefones.dart';
import 'package:flutter/material.dart';


import 'anotacoes.dart';
import 'economias.dart';
import 'infos.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _abrirInfo() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
  }

  void _abrirNotas() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Anotacoes()));
  }

  void _abrirEconomias() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Economias()));
  }

  void _abrirTelefone() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Telefones()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.purple[50], Colors.white])),
            child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset("images/logo.png"),
                  Text("Minha Agenda",
                      style: TextStyle(
                        fontFamily: 'Valentina',
                        fontSize: 50,
                        color: Colors.purple
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                "images/document.png",
                                height: 100,
                                width: 100,
                              ),
                              onTap: _abrirNotas,
                            ),
                            Text(
                              "Nova Anotação",
                              style: TextStyle(
                                  fontFamily: 'GeoSans', fontSize: 16),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                "images/cash.png",
                                height: 100,
                                width: 100,
                              ),
                              onTap: _abrirEconomias,
                            ),
                            Text("Minhas Economias",
                                style: TextStyle(
                                    fontFamily: 'GeoSans', fontSize: 16))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                "images/contacts.png",
                                height: 100,
                                width: 100,
                              ),
                              onTap: _abrirTelefone,
                            ),
                            Text(
                              "Lista Telefonica",
                              style: TextStyle(
                                  fontFamily: 'GeoSans', fontSize: 16),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                "images/info.png",
                                height: 100,
                                width: 100,
                              ),
                              onTap: _abrirInfo,
                            ),
                            Text("Informações do App",
                                style: TextStyle(
                                    fontFamily: 'GeoSans', fontSize: 16))
                          ],
                        ),
                      ],
                    ),
                  ),
                ])));
  }
}
