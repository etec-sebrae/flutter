import 'dart:io';

import 'package:app_contato/helps/contato_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContatoPage extends StatefulWidget {
  final Contato contato;

  ContatoPage({this.contato});

  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final nomeFoco = FocusNode();
  Contato _editarContato;

  bool _usuarioEditou = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.contato == null) {
      _editarContato = Contato();
    } else {
      _editarContato = Contato.from(widget.contato.toMap());
      _nomeController.text = _editarContato.nome;
      _emailController.text = _editarContato.email;
      _telefoneController.text = _editarContato.telefone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
    onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(_editarContato.nome ?? "Novo Contato"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_editarContato.nome != null && _editarContato.nome.isNotEmpty) {
              Navigator.pop(context, _editarContato);
            } else {
              FocusScope.of(context).requestFocus(nomeFoco);
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: _editarContato.imagem != null
                              ? FileImage(File(_editarContato.imagem))
                              : AssetImage("images/person.png"))),
                ),
                onTap: (){
                  ImagePicker.pickImage(source: ImageSource.camera).then(
                          (file){
                            if(file==null)return;
                            setState(() {
                              _editarContato.imagem =  file.path;
                            });
                          });
                },
              ),
              TextField(
                controller: _nomeController,
                focusNode: nomeFoco,
                decoration: InputDecoration(labelText: "Nome"),
                onChanged: (text) {
                  _usuarioEditou = true;
                  setState(() {
                    _editarContato.nome = text;
                  });
                },
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "E-mail"),
                onChanged: (text) {
                  _usuarioEditou = true;
                  _editarContato.email = text;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: "Telefone"),
                onChanged: (text) {
                  _usuarioEditou = true;
                  _editarContato.telefone = text;
                },
                keyboardType: TextInputType.phone,
              )
            ],
          ),
        ),
      ),
    );
  }
 Future<bool> _requestPop() {
    if (_usuarioEditou) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar as alterações"),
              content: Text("Se sair as alterações serão perdidas"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
