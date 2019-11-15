import 'package:moor_flutter/moor_flutter.dart';

import 'database.dart';

part 'circles_dao.g.dart';

@UseDao(tables: [Circles])
class CirclesDao extends DatabaseAccessor<M3Database> with _$CirclesDaoMixin {
  CirclesDao(M3Database db) : super(db);

  Future<List<Circle>> get allCircles => select(circles).get();

  Stream<List<Circle>> circlesInKeyword(String keyword) {
    return (select(db.keywords)..where((t) => t.word.equals(keyword)))
        .join([
          innerJoin(db.circles, db.circles.id.equalsExp(db.keywords.circleId)),
        ])
        .watch()
        .map((rows) {
          return rows.map((row) {
            return row.readTable(db.circles);
          });
        });
  }
}
