import 'package:flutter/material.dart';


class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {

  _abrirGithub() async {
    const url = 'https://github.com/juliafranca/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


   _abrirLinkedin() async{
    const url = 'https://www.linkedin.com/in/juliafranca/';
    if(await canLaunch(url)){
      await launch (url);
    }else{
      throw 'Não foi possivel caregar $url';
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
        Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.purple[50], Colors.white])),
    child:
    Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sobre o App ",
                style: TextStyle(
                    fontFamily: 'Valentina',
                    fontSize: 50,
                    color: Colors.purple
                )
            ),
              Padding(
                padding: EdgeInsets.all( 12),
                child:
                Text(
                    "Esse projeto é parte de uma atividade do curso de Especialização em desenvolvimento de aplicativos da ETEC SEBRAE.",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'GeoSans',
                      color: Colors.grey,

                    )
                ),
              ),

            Padding(padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Icones e imagens: \n\n"
                          "https://icons8.com/icon/pack/free-icons/color",

                      style:TextStyle(
                        fontSize: 15,
                        fontFamily: 'GeoSans',
                        color: Colors.grey,
                      ),
                    ),

                  ],

                )
            ),

            Padding(padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Fontes: \n\n"
                          "https://www.dafont.com/pt/manfred-klein.d302\n\n"
                  "https://www.dafont.com/pt/ellise.font\n\n"
                      " https://www.dafont.com/pt/hello-valentica.font",

                      style:TextStyle(
                        fontSize: 15,
                        fontFamily: 'GeoSans',
                        color: Colors.grey,
                      ),
                    ),

                  ],

                )
            ),

            Text("Desenvolvido por Julia França",
                style: TextStyle(
                    fontFamily: 'GeoSans',
                    fontSize:20,
                    color: Colors.purple
                )
            ),

            Padding(padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    GestureDetector(
                      child: Image.asset("images/github.png"),
                      onTap: _abrirGithub,
                    ),
                    GestureDetector(
                        child: Image.asset("images/linkedin.png"),
                      onTap: _abrirLinkedin,
                    ),
                  ],
                )
            ),



          ] ),
        )
    );
  }
}