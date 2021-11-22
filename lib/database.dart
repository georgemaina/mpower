import 'dart:async';
import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'models/counties.dart';
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

  await database.execute("CREATE TABLE counties ("
      "id                INTEGER PRIMARY KEY AUTOINCREMENT,"
      "countycode         TEXT,"
      "county             TEXT"")");

  await database.execute("CREATE TABLE sub_counties ("
      "id                INTEGER PRIMARY KEY AUTOINCREMENT,"
      "countycode         TEXT,"
      "county             TEXT,"
      "sub_county          TEXT"")");

  await database.execute("CREATE TABLE enrollments ("
      "id                INTEGER PRIMARY KEY AUTOINCREMENT,"
      "firstname         TEXT,"
      "lastname             TEXT,"
      "dob                  TEXT,"
      "sex             TEXT,"
      "phone             TEXT,"
      "nationalid             TEXT,"
      "opdno             TEXT,"
      "alcohol             TEXT,"
      "tobacco             TEXT,"
      "diet             TEXT,"
      "exercise             TEXT,"
      "hypertensive             TEXT,"
      "bp_treatment             TEXT,"
      "diabetic             TEXT,"
      "diabetes_treatment   TEXT,"
      "systolic             TEXT,"
      "diastolic             TEXT,"
      "systolic2             TEXT,"
      "diastolic2             TEXT,"
      "test_bs             TEXT,"
      "last_meal             TEXT,"
      "bs_results             TEXT,"
      "weight             TEXT,"
      "height             TEXT,"
      "voucher_no             TEXT,"
      "refer_to             TEXT"
      "inputdate             TEXT"")");

  await database.execute("CREATE TABLE diabetes ("
      "ID INTEGER PRIMARY KEY AUTOINCREMENT,"
      "chfID int,"
      "dbt1 TEXT,"
      "dbt2 TEXT,"
      "dbt3 TEXT,"
      "dbt4 TEXT,"
      "dbt5 TEXT,"
      "dbt6 TEXT,"
      "dbt7 TEXT,"
      "dbt8 TEXT,"
      "dbt9 TEXT ,"
      "dbt10 TEXT,"
      "inputDate TEXT"")");

  await database.execute("CREATE TABLE hypertension ("
      "ID INTEGER PRIMARY KEY AUTOINCREMENT,"
      "chfID int,"
      "bp1 TEXT,"
      "bp2 TEXT,"
      "bp3 TEXT,"
      "bp4 TEXT,"
      "bp5 TEXT,"
      "bp6 TEXT,"
      "bp7 TEXT,"
      "bp8 TEXT,"
      "bp9 TEXT ,"
      "bp10 TEXT,"
      "inputDate TEXT"")");

  await database.execute("CREATE TABLE anaemia ("
      "ID INTEGER PRIMARY KEY AUTOINCREMENT,"
      "chfID int,"
      "sca1 TEXT,"
      "sca2 TEXT,"
      "sca3 TEXT,"
      "sca4 TEXT,"
      "sca5 TEXT,"
      "inputDate TEXT"")");

  await database.execute("CREATE TABLE epilepsy ("
      "ID INTEGER PRIMARY KEY AUTOINCREMENT,"
      "chfID int,"
      "epy1 TEXT,"
      "epy2 TEXT,"
      "epy3 TEXT,"
      "epy4 TEXT,"
      "inputDate TEXT"")");

  await database.execute("CREATE TABLE retinopathy ("
      "ID INTEGER PRIMARY KEY AUTOINCREMENT,"
      "chfID int,"
      "dr1 TEXT,"
      "dr2 TEXT,"
      "dr3 TEXT,"
      "dr4 TEXT,"
      "dr5 TEXT,"
      "inputDate TEXT"")");

  await database.execute("CREATE TABLE cancer ("
      "ID INTEGER PRIMARY KEY AUTOINCREMENT,"
      "chfID int,"
      "bc1 TEXT,"
      "bc2 TEXT,"
      "bc3 TEXT,"
      "bc4 TEXT,"
      "inputDate TEXT"")");
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
  //Show all tables
  static Future<List<Map<String, dynamic>>> showTables() async {
    final db = await DBProvider.db();
    var results=(await db.query('sqlite_master', columns: ['type', 'name'])).forEach((row) {
      print(row.values);

    });
    // print(results);
    // return results;
     return db.query('health_workers', orderBy: "id");
  }

  // Read all items (workers)
  static Future<List<Map<String, dynamic>>> countEnrollments() async {
    final db = await DBProvider.db();
    return await db.query('enrollments', orderBy: "id");

  }

  // Read all items (workers)
  static Future<List<Map<String, dynamic>>> countRecords() async {
    final db = await DBProvider.db();
    return await db.query('health_workers', orderBy: "id");

  }

  // Read all items (workers)
  static Future<List<Map<String, dynamic>>> getEnrollment() async {
    final db = await DBProvider.db();
    return db.query('enrollments', orderBy: "id");
  }

// Read all items (workers)
  static Future<List<Map<String, dynamic>>> getWorkers() async {
    final db = await DBProvider.db();
    return db.query('health_workers', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getDiabetesData() async {
    final db = await DBProvider.db();
    return db.query('diabetes', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getHypertensionData() async {
    final db = await DBProvider.db();
    return db.query('hypertension', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getAnaemiaData() async {
    final db = await DBProvider.db();
    return db.query('anaemia', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getEpilepsyData() async {
    final db = await DBProvider.db();
    return db.query('epilepsy', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getRetinopathyData() async {
    final db = await DBProvider.db();
    return db.query('retinopathy', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getCancerData() async {
    final db = await DBProvider.db();
    return db.query('cancer', orderBy: "id");
  }

  // Read all items (Counties)
  static Future<List<Map<String, dynamic>>> getCounties() async {
    final db = await DBProvider.db();
    return db.query('counties', orderBy: "id");
  }

  // Read all items (Counties)
  static Future<List<Map<String, dynamic>>> getSubCounties() async {
    final db = await DBProvider.db();
    return db.query('sub_counties', orderBy: "id");
  }

  static Future uploadCounties() async{
    final db = await DBProvider.db();
    sql.Batch batch=db.batch();
    String countiesJson = await rootBundle.loadString('assets/subcounties.json');
    List countiesList = json.decode(countiesJson);

    countiesList.forEach((element) {
      SubCounties county=SubCounties.fromMap(element);
      batch.insert('sub_counties', county.MaptoSubCountiesListMap());
    });
    final id=await batch.commit();
    return id;
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

  static Future<int> enrollClient(String firstname,String lastname,String dob,String sex,
  String phone,String nationalid,String opdno, String alcohol,String tobacco,String diet,
  String exercise,String hypertensive,String bp_treatment,String diabetic,String diabetes_treatment,
  String systolic,String diastolic, String systolic2,String diastolic2,String test_bs, String last_meal,
  String bs_results,String weight, String height, String voucher_no, String refer_to,inputdate) async {
    final db = await DBProvider.db();

    final data = {"firstname":firstname,"lastname":lastname,"dob":dob, "sex":sex,
    "firstname":firstname,"lastname":lastname,"dob":dob,"sex":sex,"phone":phone,"nationalid":nationalid,
    "opdno":opdno,"alcohol":alcohol,"tobacco":tobacco,"diet":diet,"exercise":exercise,"hypertensive":hypertensive,
    "bp_treatment":bp_treatment,"diabetic":diabetic,"diabetes_treatment":diabetes_treatment, "systolic":systolic,
    "diastolic":diastolic,"systolic2":systolic2,"diastolic2":diastolic2,"test_bs":test_bs,"last_meal":last_meal,
    "bs_results":bs_results,"weight":weight,"height":height,"voucher_no":voucher_no, "refer_to":refer_to, "refer_to":refer_to};

    final id = await db.insert('enrollments', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getWorker(int id) async {
    final db = await DBProvider.db();
    return db.query('health_workers', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Fetch Operation: Get all
  Future<List<Map<String, dynamic>>> getTodoMapList() async {
    final db = await DBProvider.db();
    //		var result = await db.rawQuery('SELECT * FROM $todoTable order by $colTitle ASC');
    var result = await db.query("diabetes", orderBy: 'ID ASC');
    return result;
  }

  // Insert Operation: Insert a diabetes awareness to database

  static Future<int> addDiabetes(String user,String dbt1,String dbt2,String dbt3,String dbt4,
      String dbt5,String dbt6,String dbt7, String dbt8,String dbt9,String dbt10,strDate) async {
    final db = await DBProvider.db();

    final data = {"chfID":user,"dbt1":dbt1,"dbt2":dbt2,"dbt3":dbt3, "dbt4":dbt4,
      "dbt5":dbt5,"dbt6":dbt6,"dbt7":dbt7,"dbt8":dbt8,"dbt9":dbt9,"dbt10":dbt10,"inputDate":strDate};

    final id = await db.insert('diabetes', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> addHypertension(String user,String bp1,String bp2,String bp3,String bp4,
      String bp5,String bp6,String bp7, String bp8,String bp9,String bp10,strDate) async {
    final db = await DBProvider.db();

    final data = {"chfID":user,"bp1":bp1,"bp2":bp2,"bp3":bp3, "bp4":bp4,
      "bp5":bp5,"bp6":bp6,"bp7":bp7,"bp8":bp8,"bp9":bp9,"bp10":bp10,"inputDate":strDate};

    final id = await db.insert('hypertension', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> addAnaemia(String user,String sca1,String sca2,String sca3,String sca4,
      String sca5,strDate) async {
    final db = await DBProvider.db();

    final data = {"chfID":user,"sca1":sca1,"sca2":sca2,"sca3":sca3, "sca4":sca4,
      "sca5":sca5,"inputDate":strDate};

    final id = await db.insert('anaemia', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> addEpilepsy(String user,String epy1,String epy2,String epy3,String epy4,strDate) async {
    final db = await DBProvider.db();

    final data = {"chfID":user,"epy1":epy1,"epy2":epy2,"epy3":epy3, "epy4":epy4,"inputDate":strDate};

    final id = await db.insert('epilepsy', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> addRetinopathy(String user,String dr1,String dr2,String dr3,String dr4,String dr5,strDate) async {
    final db = await DBProvider.db();

    final data = {"chfID":user,"dr1":dr1,"dr2":dr2,"dr3":dr3, "dr4":dr4,"dr5":dr5,"inputDate":strDate};

    final id = await db.insert('retinopathy', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> addCancer(String user,String bc1,String bc2,String bc3,String bc4,strDate) async {
    final db = await DBProvider.db();
    final data = {"chfID":user,"bc1":bc1,"bc2":bc2,"bc3":bc3, "bc4":bc4,"inputDate":strDate};

    final id = await db.insert('cancer', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }




}
