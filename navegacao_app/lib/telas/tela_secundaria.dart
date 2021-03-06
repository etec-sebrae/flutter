import 'package:flutter/material.dart';
import 'package:navegacao_app/telas/tela_principal.dart';

class TelaSecundaria extends StatefulWidget {
  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Tela Secundaria"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Ir para tela principal"),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>TelaPrincipal()));
              },
            )
          ],
        ),
      ),
    );
  }
}
