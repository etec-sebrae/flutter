import 'package:atm/telas/tela_cliente.dart';
import 'package:atm/telas/tela_contato.dart';
import 'package:atm/telas/tela_empresa.dart';
import 'package:atm/telas/tela_servico.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _abrirRotaEmpresa(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> TelaEmpresa() ));
  }

  void _abrirRotaCliente(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaCliente()));
  }

  void _abrirRotaServico(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaServico()));
  }

  void _abrirRotaContato(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaContato()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("imagens/logo.png"),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap:_abrirRotaEmpresa,
                    child:Image.asset("imagens/menu_empresa.png"),
                  ),
                  GestureDetector(
                    onTap:_abrirRotaCliente,
                    child:Image.asset("imagens/menu_cliente.png"),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap:_abrirRotaServico,
                    child:Image.asset("imagens/menu_servico.png"),
                  ),
                  GestureDetector(
                    onTap:_abrirRotaContato,
                    child:Image.asset("imagens/menu_contato.png"),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
