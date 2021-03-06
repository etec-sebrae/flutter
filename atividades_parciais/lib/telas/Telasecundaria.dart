//import 'dart:html';

import 'package:flutter/material.dart';


class Telasecundaria extends StatefulWidget{
  // @override
  // _TelaPrincipalState CreateState() =>   _TelaPrincipalState();
// int dia= int.parse(Telaprincipal().createState().nameControler.text);
// int ano= int.parse(Telaprincipal().createState().idadeControler.text);
// String    anual="ano é (${Telasecundaria().ano})";
 // int dia= int.parse(Telaprincipal().createState().nameControler.text);
// String diario="mês é (${Telasecundaria().dia})";
  @override
  _TelaSecundarialState createState() =>   _TelaSecundarialState();

}


class _TelaSecundarialState extends State<Telasecundaria>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("Até Mais"),
        backgroundColor: Colors.purple,
      ),

      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
            children: <Widget>
            [
           //   Text(Telasecundaria().anual,textAlign: TextAlign.center,
        //          style: TextStyle(color: Colors.red, fontSize: 25.0)
          //    ),
          //    Text(Telasecundaria().diario,textAlign: TextAlign.center,
            //      style: TextStyle(color: Colors.red, fontSize: 25.0)
            //  ),
              Text("Obrigado",textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 25.0)
              )

            ]
        ),
      ),
    );
  }

}

