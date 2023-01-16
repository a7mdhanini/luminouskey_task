import 'dart:developer';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:luminouskey_task/models/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? _db;

  ///----Db Name
  static const dbName = 'test.db';

  ///----Table Name
  static const String tableUser = 'user';

  ///----Columns
  static const String cUserId = 'user_id';
  static const String cUserName = 'user_name';
  static const String cUserPassword = 'user_password';
  static const String cUserEmail = 'user_email';
  static const String cUserPhoneNumber = 'user_phone_number';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  ///----initiliz db
  initDb() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);

    return db;
  }

  ///----Create Table
  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $tableUser ("
        " $cUserId TEXT, "
        " $cUserName TEXT, "
        " $cUserEmail TEXT,"
        " $cUserPassword TEXT, "
        " $cUserPhoneNumber TEXT, "
        " PRIMARY KEY ($cUserId)"
        ")");
  }

  ///----Create New User
  Future<int> saveData(UserModel user) async {
    Database? dbClient = await db;
    var res = await dbClient!.insert(tableUser, user.toMap());
    return res;
  }

  ///----Login User
  Future<UserModel> loginUser(
      BuildContext context, String email, String password) async {
    var dbClient = await db;
    var res = await dbClient?.rawQuery(
      "SELECT * FROM $tableUser WHERE "
      "$cUserEmail = '$email' AND "
      "$cUserPassword = '$password'",
    );

    if (res!.isNotEmpty) {
      return UserModel.fromMap(res.first);
    }
    return UserModel(
      userId: '',
      userEmail: '',
      userName: '',
      userPassword: '',
      userPhoneNumber: '',
    );
  }
}
