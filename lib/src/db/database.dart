import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:m3circles/src/db/circles_dao.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Circles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get hall => text()();
  TextColumn get name => text()();
  TextColumn get pronounciation => text()();
  TextColumn get genre => text()();
  TextColumn get pr => text()();
}

class Keywords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get circleId => integer()();
  TextColumn get word => text()();
}

@UseMoor(
  tables: [
    Circles,
    Keywords,
  ],
  daos: [
    CirclesDao,
  ],
)
class M3Database extends _$M3Database {
  M3Database() : super(FlutterQueryExecutor(path: ':memory:'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: _onCreate);

  Future<void> _onCreate(Migrator m) async {
    await m.createAllTables();
    final masterDataJson = await rootBundle.loadString('assets/circles.json');
    final List masterData = jsonDecode(masterDataJson);
    return into(circles).insertAll(masterData.map((item) {
      return Circle.fromData(item, this).createCompanion(true);
    }).toList(growable: false));
  }
}
