import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anotacoes extends StatefulWidget {
  @override
  _AnotacoesState createState() => _AnotacoesState();
}

class _AnotacoesState extends State<Anotacoes> {
  String _infoText = "";
  TextEditingController notaController = TextEditingController();


  void _validarTexto(){
    _infoText = "Salvo nos seus aqrivos!";
    notaController.text = "";
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
      child:
      Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset('images/idea.png'),
                        SizedBox(height: 16.0),
                        Text(
                          'Minhas notas',
                          style: TextStyle(
                              fontFamily: 'Valentina',
                              fontSize: 50,
                              color: Colors.purple),
                        )
                      ],
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    " nova nota",
                    style: TextStyle(
                        fontFamily: 'Valentina',
                        fontSize: 20,
                        color: Colors.purple[200]),
                  ),
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontFamily: 'GeoSans'),
                    controller: notaController,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          "images/folder.png",
                        ),

                        onTap: (){
                          _validarTexto();

                        },

                      ),
                      Text(
                        "Salvar",
                        style: TextStyle(fontFamily: 'GeoSans', fontSize: 16),
                      ),

                     Padding(padding: EdgeInsets.all(32),
                       child:  Text(_infoText),
                     )
                    ],
                  ),
                ],
              ),
            )
          ]),
    ));
  }
}
