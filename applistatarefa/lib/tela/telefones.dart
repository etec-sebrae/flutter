import 'package:flutter/material.dart';

class Telefones extends StatefulWidget {
  @override
  _TelefonesState createState() => _TelefonesState();
}

class _TelefonesState extends State<Telefones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.purple[50], Colors.white])),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      Padding(padding: EdgeInsets.all(20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset('images/phoner.png',
                ),
                SizedBox(height: 16.0),
                Text('Lista Telefonica',
                  style: TextStyle(
                      fontFamily: 'Valentina',
                      fontSize: 50,
                      color: Colors.purple
                  ),
                ),

              ],
            ),]
      ),
    ),
            Text("(11) 99123-4566 - Ana\n\n"
                "(11) 99123-4566 - Maria\n\n"
                "(11) 99123-4566 - Gilberto\n\n"
                "(11) 99123-4566 - Antonio\n\n"
                "(11) 99123-4566 - Pedro\n\n",
            style: TextStyle(
              fontFamily: 'GeoSans',
              fontSize: 18
            ),),

            Column(
              children: [
                GestureDetector(
                  child:
                  Image.asset("images/addphone.png",
                    height: 100,
                    width: 100,),
                ),
                Text("Adicionar Novo Contato",
                  style: TextStyle(
                      fontFamily: 'GeoSans',
                      fontSize: 16
                  ),)
              ],
            ),
    ])
      ));
  }
}
