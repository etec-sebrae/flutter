import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _infoText = "Informe seu peso e altura para prosseguir";

  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seu peso e altura para prosseguir";
    });

  }

  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text)/100;
      double imc = weight / (height * height);

      if(imc < 18.5){
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      }else if(imc >=18.5 && imc <=24.9){
        _infoText = "Peso normal (${imc.toStringAsPrecision(3)})";
      }else if(imc >=25.0 && imc <=29.9){
        _infoText = "Sobrepeso (${imc.toStringAsPrecision(3)})";
      }else if(imc >=30.0 && imc <=34.9){
        _infoText = "Obesidade Grau 1 (${imc.toStringAsPrecision(3)})";
      }else {
        _infoText = "Obesidade Grau 2 (${imc.toStringAsPrecision(3)})";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.pink[100],
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields)
        ],
      ),
      body: SingleChildScrollView(
          padding:EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child:Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.person_outline, size: 120.0, color: Colors.pink[200],),
                TextFormField(
                  keyboardType: TextInputType.number, decoration: InputDecoration(
                    labelText: "Peso (Kg)",
                    labelStyle: TextStyle(color: Colors.pink,fontSize: 25.0)
                ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
                  controller:weightController,
                  validator: (value){
                    if(value.isEmpty){
                      return "Insira seu peso!";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number, decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.pink,fontSize: 25.0)
                ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
                  controller: heightController,
                  validator: (value){
                    if(value.isEmpty){
                      return "Insira sua altura!";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right:20.0, top: 20, bottom: 20),
                  child:  Container(
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.pink[100],
                      onPressed: (){
//                    _calculate();
                        if(_formKey.currentState.validate()){
                          _calculate();
                        }
                      },
                      child:Text("Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 25.0,)),
                    ),
                  ),
                ), Text(_infoText, textAlign: TextAlign.center,
                  style: TextStyle(color:Colors.blueGrey, fontSize: 20.0),)
              ],) ,
          )
      )
      ,
    );
  }
}
