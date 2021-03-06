import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Signos extends StatefulWidget {
  @override //
  _SignosState createState() => _SignosState();
}

class _SignosState extends State<Signos> {
  TextEditingController diaController = TextEditingController();
  TextEditingController mesController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _infoText ="Informe seu dia e mês de nascimento por favor!";

  void _resetFields(){
    diaController.text = "";
    mesController.text = "";
    setState(() {
      String _infoText = "informe seus dados!";
    });
  }
//
  void _signosAstros(){
    setState(() {
      int dia = int.parse(diaController.text);
      int mes = int.parse(mesController.text);

      switch(mes){
        case 1:{
          if(dia <= 20) {
            _infoText = "Você é de Capricornio ";
          }else if( dia >= 21){
            _infoText = "Você é de Aquario ";
          }
        } break;
        case 2:{
          if(dia <= 19) {
            _infoText = "Você é de Aquario ";
          }else if( dia >= 20){
            _infoText = "Você é de Peixes ";
          }
        } break;
        case 3:{
          if(dia <= 20) {
            _infoText = "Você é de Peixes ";
          }else if( dia >= 21){
            _infoText = "Você é de Áries ";
          }
        } break;
        case 4:{
          if(dia <= 20) {
            _infoText = "Você é de Àries ";
          }else if( dia >= 21){
            _infoText = "Você é de Touro ";
          }
        } break;
        case 5:{
          if(dia <= 20) {
            _infoText = "Você é de Touro ";
          }else if( dia >= 21){
            _infoText = "Você é de Gêmeos ";
          }
        } break;
        case 6:{
          if(dia <= 20) {
            _infoText = "Você é de Gêmeos";
          }else if( dia >= 21){
            _infoText = "Você é de Cancer ";
          }
        } break;
        case 7:{
          if(dia <= 21) {
            _infoText = "Você é de Cancer ";
          }else if( dia >= 22){
            _infoText = "Você é de Leão ";
          }
        } break;
        case 8:{
          if(dia <= 22) {
            _infoText = "Você é de Leão ";
          }else if( dia >= 23){
            _infoText = "Você é de Virgem ";
          }
        } break;
        case 9:{
          if(dia <= 22) {
            _infoText = "Você é de Virgem ";
          }else if( dia >= 23){
            _infoText = "Você é de Libra ";
          }
        } break;
        case 10:{
          if(dia <= 22) {
            _infoText = "Você é de Libra ";
          }else if( dia >= 23){
            _infoText = "Você é de Escorpião ";
          }
        } break;
        case 11:{
          if(dia <= 21) {
            _infoText = "Você é de Escorpião ";
          }else if( dia >= 22){
            _infoText = "Você é de Sargitario ";
          }
        } break;
        case 12:{
          if(dia <= 21) {
            _infoText = "Você é de Sargitario ";
          }else if( dia >= 22){
            _infoText = "Você é de Capricornio ";
          }
        } break;

        default:{
          _infoText = " Digite seu mês e dia de nascimento, Por favor!(${mes.toStringAsPrecision(3)})";
        } break;
      }
    });
    }

        @override
        Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Astrologia dos Signos"),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.ac_unit,
                    size: 120.0,
                    color: Colors.purpleAccent),
                TextFormField(keyboardType: TextInputType.number,decoration: InputDecoration(
                  labelText: "Dia do nascimento:",
                  labelStyle: TextStyle(color: Colors.green),
                ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.purpleAccent,fontSize: 25.0),
                  controller: diaController,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira o dia do seu nascimento:";
                    }
                  },
                ),
                TextFormField(keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Mês de nascimento:",
                      labelStyle: TextStyle(color: Colors.green)
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.purpleAccent,fontSize: 25.0),
                  controller: mesController,
                  // ignore: missing_return
                  validator: (value){
                    if(value.isEmpty){
                      return "Insira seu mês de nascimento:";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                  child:  Container(
                    height: 80.0,
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          _signosAstros();
                        }
                      },
                      child: Text("Gerar",
                        style: TextStyle(color: Colors.white,fontSize: 25.0),
                      ),
                      color: Colors.purpleAccent,
                    ),
                  ),
                ),

                Text(_infoText,
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(color: Colors.purpleAccent,fontSize: 25.0))
              ],
            ) ,
          ),
        ),
      );
    }
  }

