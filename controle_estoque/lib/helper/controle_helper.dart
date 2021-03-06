
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String tbEstoque = "tb_estoque";
final String idEstoque = "id_estoque";
final String nomeEmpresaEstoque = "nome_empresa";
final String nomeProdutoEstoque = "nome_produto";
final String quatidadeProdutoEstoque = "quatidade_produto";


class EstoqueHelper {

  static final EstoqueHelper _instance = EstoqueHelper.internal();

  factory EstoqueHelper() => _instance;

  EstoqueHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, "estoque.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) {
          db.execute("CREATE TABLE $tbEstoque($idEstoque INTEGER PRIMARY KEY, "
              "$nomeEmpresaEstoque TEXT, "
              "$nomeProdutoEstoque TEXT, "
              "$quatidadeProdutoEstoque INTEGER)");
        });
  }

  Future<Estoque> salvarEstoque(Estoque Estoque) async {
    Database dbEstoque = await db;
    Estoque.id = await dbEstoque.insert(tbEstoque, Estoque.toMap());
    return Estoque;
  }

  Future<Estoque> getEstoque(int id) async {
    Database dbEstoque = await db;
    List<Map> maps = await dbEstoque.query(tbEstoque,
        columns: [
          idEstoque,
          nomeEmpresaEstoque,
          nomeProdutoEstoque,
          quatidadeProdutoEstoque
        ],
        where: "$idEstoque = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Estoque.from(maps.first);
    } else {
      return null;
    }
  }

  Future<List> getEstoques() async {
    Database dbEstoque = await db;
    List Estoques = await dbEstoque.rawQuery("SELECT * FROM $tbEstoque");
    List<Estoque> listaEstoque = List();
    for (Map m in Estoques) {
      listaEstoque.add(Estoque.from(m));
    }
    return listaEstoque;
  }

  updateEstoque(Estoque Estoque) async {
    Database dbEstoque = await db;
    return await dbEstoque.update(
      tbEstoque,
      Estoque.toMap(),
      where: "$idEstoque = ?",
      whereArgs: [Estoque.id],
    );
  }

  deleteEstoque(int id) async{
    Database dbEstoque = await db;
    dbEstoque.delete(tbEstoque,
      where: "$idEstoque = ?",
      whereArgs: [id],
    );
  }

}
  class Estoque {

    int id;
    String nomeEmpresa;
    String nomeProduto;
    int quatidadeProduto;

    Estoque();

  Estoque.from(Map map) {
    id = map[idEstoque];
    nomeEmpresa = map[nomeEmpresaEstoque];
    nomeProduto = map[nomeProdutoEstoque];
    quatidadeProduto = map[quatidadeProdutoEstoque];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nomeEmpresaEstoque: nomeEmpresa,
      nomeProdutoEstoque: nomeProduto,
      quatidadeProdutoEstoque: quatidadeProduto,

    };
    if (id != null) {
      map[idEstoque] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Estoque( id: $id, nomeEmpresa: $nomeEmpresa, nomeProduto: $nomeProduto, quatidadeProduto: $quatidadeProduto";
  }

}