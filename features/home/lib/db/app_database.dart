import 'dart:io';

import 'package:auth/dao/auth_dao.dart';
import 'package:auth/table/auth_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:home/dao/restaurant_dao.dart';
import 'package:home/table/restaurant_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    RestaurantTable,
    AuthTable
  ],
  daos: [
    RestaurantDao,
    AuthDao
  ]
)
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(_openConnection());

  int get schemaVersion => 1;

  static _openConnection() {
    return LazyDatabase(() async {
      // put the database file, called db.sqlite here, into the documents folder
      // for your app.
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'restaurant_db.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}