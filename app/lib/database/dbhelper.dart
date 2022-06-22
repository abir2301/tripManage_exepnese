import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBhelper {
  DBhelper.privateConstructor();
  static final DBhelper instance = DBhelper.privateConstructor();
  static late Database _db;
  final _databaseName = 'abir3';
  final _databaseVersion = 2;
  Future<Database> get database async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    var theDb = await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
    return theDb;
  }

  FutureOr<void> _onCreate(Database db, int version) {
    Future onCreate(Database db, int version) async {
      print("creating data base ");
//trip table done
      await db
          .execute(
              'CREATE TABLE trip ( tripId INTEGER PRIMARY KEY AUTOINCREMENT  ,tripName TEXT ,tripDescription TEXT, trip_Date_Start TEXT,  trip_date_finich TEXT,trip_Image TEXT)')
          .then((value) {
        print(" create  trip table  ");
      }).catchError((Error) {
        print("creating trip table ${Error.toString()}");
      });

//person_trip table
      await db
          .execute(
              'CREATE TABLE person  ( personid INTEGER PRIMARY KEY AUTOINCREMENT ,personName TEXT,personDepositAmount INT,Key_person_trip INT , FOREIGN KEY (Key_person_trip) REFERENCES trip (tripId) )')
          .catchError((Error) {
        print("error while creating person trip table ${Error.toString()}");
      }).then((value) {
        print("create person trip ");
      });
//table profile done

      await db
          .execute(
              'CREATE TABLE profile ( profileId INTEGER PRIMARY KEY AUTOINCREMENT,  profileName TEXT , ProfileEmail TEXT )')
          .then((value) {
        print("create  profile table  ");
      }).catchError((Error) {
        print("erro while creating profile table ");
      });
      //category table done
      await db
          .execute(
              'CREATE TABLE category (categoryId INTEGER PRIMARY KEY AUTOINCREMENT,categoryName TEXT)')
          .then((value) {
        print(" create categori table ");
      }).catchError((Error) {
        print(Error.toString());
      });
      //tows_list_trip table
      await db
          .execute(
              ' CREATE TABLE townlist ( place_id INTEGER PRIMARY KEY AUTOINCREMENT, place_name TEXT,key_trip_place INT , FOREIGN KEY (key_trip_place) REFERENCES  trip(tripId) )')
          .catchError((Error) {
        print("error while crating ${Error.toString()} ");
      }).then((value) {
        print("creating trip list table ");
      });

      //person_expense table
      await db
          .execute(
              'CREATE TABLE personexpense ( expenseid INTEGER PRIMARY KEY AUTOINCREMENT, nameexpense TEXT, expenseAmount TEXT, key_expense_category INT NOT NULL,FOREIGN KEY (key_expense_category) REFERENCES category (categoryId) , Key_person_expense INT NOT NULL, FOREIGN KEY (Key_person_expense) REFERENCES person (personid))')
          .catchError((Error) {
        print("error while creating  Personexpensetable ${Error.toString()}");
      }).then((value) {
        print("create Personexpense table ");
      });

      //profile table

      print("data base created suucesfully ");
    }
  }
}
