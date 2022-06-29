import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE text_value(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'text_value.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (long string)
  static Future<int> createItem(String title, String? description) async {
    final db = await SQLHelper.db();

    final data = {'title': title, 'description': description};

    final id = await db.insert('text_value', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }


  // Read all items (long String)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('text_value', orderBy: "id");
  }


  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('text_value', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // // Update an item by id
  // static Future<int> updateItem(
  //     int id, String title, String? descrption) async {
  //   final db = await SQLHelper.db();

  //   final data = {
  //     'title': title,
  //     'description': descrption,
  //   };

  //   final result =
  //       await db.update('text_value', data, where: "id = ?", whereArgs: [id]);
  //   return result;
  // }

  // // Delete
  // static Future<void> deleteItem(int id) async {
  //   final db = await SQLHelper.db();
  //   try {
  //     await db.delete("text_value", where: "id = ?", whereArgs: [id]);
  //   } catch (err) {
  //     debugPrint("Something went wrong when deleting an item: $err");
  //   }
  // }


}