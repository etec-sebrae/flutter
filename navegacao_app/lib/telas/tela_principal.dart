import 'package:flutter/material.dart';
import 'package:navegacao_app/telas/tela_secundaria.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Ir para segunda tela"),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>TelaSecundaria()));
              },
            )
          ],
        ),
      ),
    );
  }
}
