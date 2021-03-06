//import 'dart:html';

import 'package:flutter/material.dart';

import 'Telasecundaria.dart';

class Telaprincipal extends StatefulWidget{

  @override
  _TelaPrincipalState createState() =>   _TelaPrincipalState();

}


class _TelaPrincipalState extends State<Telaprincipal>{
  TextEditingController nameControler = TextEditingController();
  TextEditingController idadeControler = TextEditingController();
  GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  String _infoText = "Informe daodos de hoje";
  String _infoText2 = "";

  void _resetfields(){
    nameControler.text= "";
   idadeControler.text= "";
  }

  void _mudaTela(){
   int weight= int.parse(nameControler.text);
   int weight2= int.parse(idadeControler.text);
    setState(() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>Telasecundaria()));

 _infoText = "mês (${weight.toString()})";
 _infoText2 = "ano (${weight2.toString()})";
        });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Atividade:Leandro P Amorim"),
        backgroundColor: Colors.purple,
      ),
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0,0.0, 10.0, 0.0),
            child: Form(
              key:_formKey,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
               //   Icon(Icons.person_outline, size: 120.0,color: Colors.blue,),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText:"mes",
                        labelStyle: TextStyle(color: Colors.red)
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color:Colors.red,fontSize: 25.0),
                    controller: nameControler,
                    // validator: (Value){
                    // if(value.isEmpty){
                    // return"insira seu peso";
                    //}
                    // }
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText:"ano",
                        labelStyle: TextStyle(color: Colors.red)
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color:Colors.red,fontSize: 25.0),
                    controller: idadeControler,
                    // validator: (Value){
                    // if(value.isEmpty){
                    // return"insira sua altura";
                    //}
                    // }
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child:           Container(
                        height: 100.0,
                        child:              RaisedButton(
                          child: Text("Confirmar"),
                          onPressed: (){
                            if (_formKey.currentState.validate()) {
                              _mudaTela();
                           }
                          },
                        )
                    ),
                  ),
              Text(_infoText,textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 25.0)
              ),
                  Text(_infoText2,textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red, fontSize: 25.0)
                  )
                ],
              ),
            )
        )
    );
  }

}



