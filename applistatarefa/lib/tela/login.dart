import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minha_agenda/telas/homepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _infoText = "Informe seu usuário e senha para entrar";

  void _resetFields() {
    loginController.text = "";
    senhaController.text = "";
    setState(() {
      _infoText = "Informe seu usuário e senha para entrar";
    });
  }

  void _abrirHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void _validarLogin() {
    setState(() {
      String user = loginController.text;
      String senha = senhaController.text;
      if (user == "Julia" && senha == "123") {
        _infoText = " Bem vinda (o) $user";
        _abrirHome();
      } else {
        _infoText = "Usuário ou Senha Incorretos. Tente novamente";
        loginController.text = "";
        senhaController.text = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Minha Agenda"),
          actions: [
            IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
          ],
          backgroundColor: Colors.purple[100],
        ),
        body:

        SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("images/bgm.png"),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Login",
                        labelStyle: TextStyle(
                          fontFamily: 'GeoSans',
                          fontSize: 20,
                        )),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'GeoSans',
                        color: Colors.black,
                        fontSize: 20.0),
                    controller: loginController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira seu Usuário";
                      }
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Senha",
                          labelStyle: TextStyle(
                            fontFamily: 'GeoSans',
                            fontSize: 20,
                          )),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'GeoSans',
                          color: Colors.black,
                          fontSize: 20.0),
                      controller: senhaController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira sua Senha";
                        }
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      child: Text(
                        "Entrar",
                        style: TextStyle(fontFamily: 'GeoSans', fontSize: 18),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _validarLogin();
                        }
                      },
                      color: Colors.purple[200],
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      splashColor: Colors.grey,
                    )),
                Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 15.0),
                )
              ],
            ),
          ),
        ));
  }
}
