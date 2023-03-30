import 'dart:ui';

import 'db_connect.dart';
import 'package:sqflite/sqflite.dart';


class Repo{
  DataBaseConnect? _dataBaseConnect;

  Repo(){
    _dataBaseConnect=DataBaseConnect();
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database=await _dataBaseConnect!.setDatabase();
    return _database!;
  }

  insertData(table,data) async {
    var connection = await database;
    return await connection.insert(table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  readData(table) async {
    var con = await database;
    return await con.query(table);
  }
  readDataWithID(table, itemID) async {
    var con = await database;
    return await con.query(table, where: "id=?", whereArgs: [itemID]);
  }
  updateData(table, data) async {
    var con = await database;
    return await con.rawUpdate(
        "UPDATE $table SET quantity=? where id=?",
        [data["quantity"],
      data["id"],]);
  }

  deleteData(table, itemId) async {
    var con = await database;
    return await con.rawDelete("DELETE FROM $table where id=$itemId");
  }

}