import 'package:drift/drift.dart';

import '../table/auth_table.dart';
import 'package:home/db/app_database.dart';

part 'auth_dao.g.dart';

@DriftAccessor(tables: [AuthTable])
class AuthDao extends DatabaseAccessor<AppDatabase> with _$AuthDaoMixin {
  AuthDao(AppDatabase db) : super(db);

  Future insertRestaurant(AuthTableData data) => into(authTable).insert(data, mode: InsertMode.insertOrReplace);

  Future<List<AuthTableData>> getRestaurants() => select(authTable).get();
}