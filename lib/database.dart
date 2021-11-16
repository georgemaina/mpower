import 'dart:async';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:mpower/models/HealthWorkers.dart';
import 'package:sqflite/sqflite.dart' as sql;
// import 'package:flutter/foundation.dart';


class DBProvider {

  static Future<void> createTables(sql.Database database) async {
  await database.execute("CREATE TABLE health_workers ("
      "id                INTEGER PRIMARY KEY AUTOINCREMENT,"
      "names             TEXT,"
      "phone             TEXT,"
      "facility          TEXT,"
      "county            TEXT,"
      "subcounty         TEXT,"
      "mflcode           TEXT,"
      "venue             TEXT,"
      "gathering         TEXT,"
      "menreached        TEXT,"
      "womenreached      TEXT,"
      "disabledreached   TEXT,"
      "inputdate         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP"")");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'mpower.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

// Read all items (workers)
  static Future<List<Map<String, dynamic>>> getWorkers() async {
    final db = await DBProvider.db();
    return db.query('health_workers', orderBy: "id");
  }

  // Create new item (journal)
  static Future<int> createWorker(String names,String phone,String facility, String county,
                                  String subcounty,String mflcode,
                      String venue,String gathering,String menreached,String womenreached,
                      String disabledreached,inputdate) async {
    final db = await DBProvider.db();

    final data = {"names":names,"phone":phone,"facility":facility, "county":county,"subcounty":subcounty,"mflcode":mflcode,
      "venue":venue,"gathering":gathering,"menreached":menreached,"womenreached":womenreached,
      "disabledreached":disabledreached,"inputdate":inputdate};
    final id = await db.insert('health_workers', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getWorker(int id) async {
    final db = await DBProvider.db();
    return db.query('health_workers', where: "id = ?", whereArgs: [id], limit: 1);
  }


}
