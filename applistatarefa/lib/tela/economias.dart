import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Economias extends StatefulWidget {
  @override
  _EconomiasState createState() => _EconomiasState();
}

class _EconomiasState extends State<Economias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.purple[50], Colors.white])),
    child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      Padding(padding: EdgeInsets.all(20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset('images/pig.png',
                ),
                SizedBox(height: 16.0),
                Text('Minhas Economias',
                  style: TextStyle(
                      fontFamily: 'Valentina',
                      fontSize: 50,
                      color: Colors.purple
                  ),)
              ],
            ),]
      ),
    ),
         Padding(padding: EdgeInsets.all(20),
         child:
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             SizedBox(
               child:
               Text(
                 "Entradas\n\n",
                 style: TextStyle(
                   fontFamily: 'Valentina',
                   fontSize: 20
                 ),
               ),
             ),
             SizedBox(
               child:
               Text(
                   "Saidas\n\n",
                 style: TextStyle(
                     fontFamily: 'Valentina',
                     fontSize: 20
                 ),

               ),
             )
           ],
         ),
         ),
          Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child:
                      Text(
                              "RS 100,00\n\n"
                              "Rs 250,00 \n\n"
                              "Rs 389,00 \n\n"
                              "Rs 2890,00 \n\n",
                          style: TextStyle(
                              fontFamily: 'GeoSans'
                          )
                      ),
                    ),
                    SizedBox(
                      child:
                      Text(
                              "RS 80,00\n\n"
                              "RS 20,00 \n\n"
                              "Rs 90,00 \n\n",
                        style: TextStyle(
                          fontFamily: 'GeoSans'
                        ),
                      ),
                    )
                  ],
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text("Total diponivel = 1200,00",
                  style: TextStyle(
                      fontFamily: 'Valentina',
                      fontSize: 20,
                      color: Colors.black
                  ),
              ),
                Image.asset("images/coins.png")
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  child:
                  Image.asset("images/men.png",
                    height: 100,
                    width: 100,),
                ),
                Text("Adicionar Novo valor",
                  style: TextStyle(
                      fontFamily: 'GeoSans',
                      fontSize: 16
                  ),)
              ],
            ),
        ])
      ) );
  }
}
