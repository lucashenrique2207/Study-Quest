import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studyquest/Widgets/users.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "users.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
            CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(80) NOT NULL UNIQUE,
    nickname VARCHAR(20) NOT NULL UNIQUE,
    pontos INT NOT NULL
);/n

CREATE TABLE grupo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_grupo VARCHAR(50) NOT NULL
);/n

CREATE TABLE users_grupo (
    usuario_id INT,
    grupo_id INT,
    PRIMARY KEY (usuario_id, grupo_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (grupo_id) REFERENCES grupo(id) ON DELETE C
          ''');
      },
    );
  }

  //Listar usuários
  Future<List<User>> getProducts() async {
    Database db = await instance.database;
    var products = await db.query("users", orderBy: "id");

    List<User> prodList = products.isNotEmpty
        ? products.map((p) => User.fromMap(p)).toList()
        : [];

    return prodList;
  }

  //Salvar produto
  Future<int> addProduct(User p) async {
    Database db = await instance.database;
    return await db.insert("users", p.toMap());
  }

  Future<int> removeProduct(int id) async {
    Database db = await instance.database;
    return await db.delete("users", where: "id = ?", whereArgs: [id]);
  }

  Future<int> updateProduct(User p) async {
    Database db = await instance.database;
    return await db.update(
      "users",
      p.toMap(),
      where: "id = ?",
      whereArgs: [p.id],
    );
  }
}