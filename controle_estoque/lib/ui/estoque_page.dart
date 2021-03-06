import 'package:controle_estoque/helper/controle_helper.dart';
import 'package:flutter/material.dart';

class EstoquePage extends StatefulWidget {
  final Estoque estoque;

  EstoquePage({this.estoque});

  @override
  _EstoquePageState createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  Estoque _produtoEditado;
  bool usuarioEditou = false;

  final _nomeEmpresaController = TextEditingController();
  final _nomeProdutoController = TextEditingController();
  final _quantidadeController = TextEditingController();

  final _nomeFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.estoque == null) {
      _produtoEditado = Estoque();
    } else {
      _produtoEditado = Estoque.from(widget.estoque.toMap());
      _nomeEmpresaController.text = _produtoEditado.nomeEmpresa;
      _nomeProdutoController.text = _produtoEditado.nomeProduto;
      _quantidadeController.text = _produtoEditado.quantidadeProduto.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_produtoEditado.nomeProduto ?? "Novo Produto"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_produtoEditado.nomeEmpresa != null &&
                _produtoEditado.nomeEmpresa.isNotEmpty) {
              Navigator.pop(context, _produtoEditado);
            } else {
              FocusScope.of(context).requestFocus(_nomeFocus);
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nomeEmpresaController,
                focusNode: _nomeFocus,
                decoration: InputDecoration(labelText: "Nome Empresa"),
                onChanged: (text) {
                  usuarioEditou = true;
                  setState(() {
                    _produtoEditado.nomeEmpresa = text;
                  });
                },
              ),
              TextField(
                controller: _nomeProdutoController,
                decoration: InputDecoration(labelText: "Nome Produto"),
                onChanged: (text) {
                  usuarioEditou = true;
                  _produtoEditado.nomeProduto = text;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _quantidadeController,
                decoration: InputDecoration(labelText: "quantidade"),
                onChanged: (text) {
                  usuarioEditou = true;
                  _produtoEditado.quatidadeProduto = text.toString();
                },
                keyboardType: TextInputType.number,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (usuarioEditou) {
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
                  child: Text("Sair"),
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
