import 'dart:io';
import 'package:controle_estoque/helper/controle_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'estoque_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EstoqueHelper helper = EstoqueHelper();

  List<Estoque> produtos = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListaProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controle Estoque"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEstoquePage();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            return _cartaoContato(context, index);
          }),
    );
  }

  Widget _cartaoContato(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
             Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(produtos[index].nomeEmpresa ?? "",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    Text(produtos[index].nomeProduto ?? "",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    Text(produtos[index].quatidadeProduto ?? "",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        _showOptions(context, index);
      },
    );
  }

  void _showOptions(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("Editar", style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                          _showEstoquePage(estoque: produtos[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("Deletar", style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                        onPressed: (){
                          helper.deleteEstoque(produtos[index].id);
                          setState(() {
                            produtos.removeAt(index);
                            Navigator.pop(context);
                          });
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  void _showEstoquePage({Estoque estoque}) async {
    final estoqueEditado = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EstoquePage(
              estoque: estoque,
            )));
    if (estoqueEditado != null) {
      if (estoque != null) {
        await helper.updateEstoque(estoqueEditado);
      } else {
        helper.salvarEstoque(estoqueEditado);
      }
      getListaProdutos();
    }
  }

  void getListaProdutos() {
    helper.getEstoques().then((list) {
      setState(() {
        produtos = list;
      });
    });
  }
}
