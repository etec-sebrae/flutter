import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Habito"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
             onPressed: (){
              print("Cliquei");
             } ,
          )

        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child:  Text("Teste",style: TextStyle(
              color: Colors.green, fontSize: 30
            ),),
          ),
          Icon(Icons.person_outline, size: 120,),
          TextField(
            decoration: InputDecoration(
              labelText: "Digite seu nome",
            ),

          )

        ],
      ),

    )
  ));
}