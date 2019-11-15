// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Circle extends DataClass implements Insertable<Circle> {
  final int id;
  final String hall;
  final String name;
  final String pronounciation;
  final String genre;
  final String pr;
  Circle(
      {@required this.id,
      @required this.hall,
      @required this.name,
      @required this.pronounciation,
      @required this.genre,
      @required this.pr});
  factory Circle.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Circle(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      hall: stringType.mapFromDatabaseResponse(data['${effectivePrefix}hall']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      pronounciation: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pronounciation']),
      genre:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}genre']),
      pr: stringType.mapFromDatabaseResponse(data['${effectivePrefix}pr']),
    );
  }
  factory Circle.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Circle(
      id: serializer.fromJson<int>(json['id']),
      hall: serializer.fromJson<String>(json['hall']),
      name: serializer.fromJson<String>(json['name']),
      pronounciation: serializer.fromJson<String>(json['pronounciation']),
      genre: serializer.fromJson<String>(json['genre']),
      pr: serializer.fromJson<String>(json['pr']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'hall': serializer.toJson<String>(hall),
      'name': serializer.toJson<String>(name),
      'pronounciation': serializer.toJson<String>(pronounciation),
      'genre': serializer.toJson<String>(genre),
      'pr': serializer.toJson<String>(pr),
    };
  }

  @override
  CirclesCompanion createCompanion(bool nullToAbsent) {
    return CirclesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      hall: hall == null && nullToAbsent ? const Value.absent() : Value(hall),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      pronounciation: pronounciation == null && nullToAbsent
          ? const Value.absent()
          : Value(pronounciation),
      genre:
          genre == null && nullToAbsent ? const Value.absent() : Value(genre),
      pr: pr == null && nullToAbsent ? const Value.absent() : Value(pr),
    );
  }

  Circle copyWith(
          {int id,
          String hall,
          String name,
          String pronounciation,
          String genre,
          String pr}) =>
      Circle(
        id: id ?? this.id,
        hall: hall ?? this.hall,
        name: name ?? this.name,
        pronounciation: pronounciation ?? this.pronounciation,
        genre: genre ?? this.genre,
        pr: pr ?? this.pr,
      );
  @override
  String toString() {
    return (StringBuffer('Circle(')
          ..write('id: $id, ')
          ..write('hall: $hall, ')
          ..write('name: $name, ')
          ..write('pronounciation: $pronounciation, ')
          ..write('genre: $genre, ')
          ..write('pr: $pr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          hall.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(pronounciation.hashCode,
                  $mrjc(genre.hashCode, pr.hashCode))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Circle &&
          other.id == this.id &&
          other.hall == this.hall &&
          other.name == this.name &&
          other.pronounciation == this.pronounciation &&
          other.genre == this.genre &&
          other.pr == this.pr);
}

class CirclesCompanion extends UpdateCompanion<Circle> {
  final Value<int> id;
  final Value<String> hall;
  final Value<String> name;
  final Value<String> pronounciation;
  final Value<String> genre;
  final Value<String> pr;
  const CirclesCompanion({
    this.id = const Value.absent(),
    this.hall = const Value.absent(),
    this.name = const Value.absent(),
    this.pronounciation = const Value.absent(),
    this.genre = const Value.absent(),
    this.pr = const Value.absent(),
  });
  CirclesCompanion.insert({
    this.id = const Value.absent(),
    @required String hall,
    @required String name,
    @required String pronounciation,
    @required String genre,
    @required String pr,
  })  : hall = Value(hall),
        name = Value(name),
        pronounciation = Value(pronounciation),
        genre = Value(genre),
        pr = Value(pr);
  CirclesCompanion copyWith(
      {Value<int> id,
      Value<String> hall,
      Value<String> name,
      Value<String> pronounciation,
      Value<String> genre,
      Value<String> pr}) {
    return CirclesCompanion(
      id: id ?? this.id,
      hall: hall ?? this.hall,
      name: name ?? this.name,
      pronounciation: pronounciation ?? this.pronounciation,
      genre: genre ?? this.genre,
      pr: pr ?? this.pr,
    );
  }
}

class $CirclesTable extends Circles with TableInfo<$CirclesTable, Circle> {
  final GeneratedDatabase _db;
  final String _alias;
  $CirclesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _hallMeta = const VerificationMeta('hall');
  GeneratedTextColumn _hall;
  @override
  GeneratedTextColumn get hall => _hall ??= _constructHall();
  GeneratedTextColumn _constructHall() {
    return GeneratedTextColumn(
      'hall',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pronounciationMeta =
      const VerificationMeta('pronounciation');
  GeneratedTextColumn _pronounciation;
  @override
  GeneratedTextColumn get pronounciation =>
      _pronounciation ??= _constructPronounciation();
  GeneratedTextColumn _constructPronounciation() {
    return GeneratedTextColumn(
      'pronounciation',
      $tableName,
      false,
    );
  }

  final VerificationMeta _genreMeta = const VerificationMeta('genre');
  GeneratedTextColumn _genre;
  @override
  GeneratedTextColumn get genre => _genre ??= _constructGenre();
  GeneratedTextColumn _constructGenre() {
    return GeneratedTextColumn(
      'genre',
      $tableName,
      false,
    );
  }

  final VerificationMeta _prMeta = const VerificationMeta('pr');
  GeneratedTextColumn _pr;
  @override
  GeneratedTextColumn get pr => _pr ??= _constructPr();
  GeneratedTextColumn _constructPr() {
    return GeneratedTextColumn(
      'pr',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, hall, name, pronounciation, genre, pr];
  @override
  $CirclesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'circles';
  @override
  final String actualTableName = 'circles';
  @override
  VerificationContext validateIntegrity(CirclesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.hall.present) {
      context.handle(
          _hallMeta, hall.isAcceptableValue(d.hall.value, _hallMeta));
    } else if (hall.isRequired && isInserting) {
      context.missing(_hallMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.pronounciation.present) {
      context.handle(
          _pronounciationMeta,
          pronounciation.isAcceptableValue(
              d.pronounciation.value, _pronounciationMeta));
    } else if (pronounciation.isRequired && isInserting) {
      context.missing(_pronounciationMeta);
    }
    if (d.genre.present) {
      context.handle(
          _genreMeta, genre.isAcceptableValue(d.genre.value, _genreMeta));
    } else if (genre.isRequired && isInserting) {
      context.missing(_genreMeta);
    }
    if (d.pr.present) {
      context.handle(_prMeta, pr.isAcceptableValue(d.pr.value, _prMeta));
    } else if (pr.isRequired && isInserting) {
      context.missing(_prMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Circle map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Circle.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CirclesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.hall.present) {
      map['hall'] = Variable<String, StringType>(d.hall.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.pronounciation.present) {
      map['pronounciation'] =
          Variable<String, StringType>(d.pronounciation.value);
    }
    if (d.genre.present) {
      map['genre'] = Variable<String, StringType>(d.genre.value);
    }
    if (d.pr.present) {
      map['pr'] = Variable<String, StringType>(d.pr.value);
    }
    return map;
  }

  @override
  $CirclesTable createAlias(String alias) {
    return $CirclesTable(_db, alias);
  }
}

class Keyword extends DataClass implements Insertable<Keyword> {
  final int id;
  final int circleId;
  final String word;
  Keyword({@required this.id, @required this.circleId, @required this.word});
  factory Keyword.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Keyword(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      circleId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}circle_id']),
      word: stringType.mapFromDatabaseResponse(data['${effectivePrefix}word']),
    );
  }
  factory Keyword.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Keyword(
      id: serializer.fromJson<int>(json['id']),
      circleId: serializer.fromJson<int>(json['circleId']),
      word: serializer.fromJson<String>(json['word']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'circleId': serializer.toJson<int>(circleId),
      'word': serializer.toJson<String>(word),
    };
  }

  @override
  KeywordsCompanion createCompanion(bool nullToAbsent) {
    return KeywordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      circleId: circleId == null && nullToAbsent
          ? const Value.absent()
          : Value(circleId),
      word: word == null && nullToAbsent ? const Value.absent() : Value(word),
    );
  }

  Keyword copyWith({int id, int circleId, String word}) => Keyword(
        id: id ?? this.id,
        circleId: circleId ?? this.circleId,
        word: word ?? this.word,
      );
  @override
  String toString() {
    return (StringBuffer('Keyword(')
          ..write('id: $id, ')
          ..write('circleId: $circleId, ')
          ..write('word: $word')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(circleId.hashCode, word.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Keyword &&
          other.id == this.id &&
          other.circleId == this.circleId &&
          other.word == this.word);
}

class KeywordsCompanion extends UpdateCompanion<Keyword> {
  final Value<int> id;
  final Value<int> circleId;
  final Value<String> word;
  const KeywordsCompanion({
    this.id = const Value.absent(),
    this.circleId = const Value.absent(),
    this.word = const Value.absent(),
  });
  KeywordsCompanion.insert({
    this.id = const Value.absent(),
    @required int circleId,
    @required String word,
  })  : circleId = Value(circleId),
        word = Value(word);
  KeywordsCompanion copyWith(
      {Value<int> id, Value<int> circleId, Value<String> word}) {
    return KeywordsCompanion(
      id: id ?? this.id,
      circleId: circleId ?? this.circleId,
      word: word ?? this.word,
    );
  }
}

class $KeywordsTable extends Keywords with TableInfo<$KeywordsTable, Keyword> {
  final GeneratedDatabase _db;
  final String _alias;
  $KeywordsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _circleIdMeta = const VerificationMeta('circleId');
  GeneratedIntColumn _circleId;
  @override
  GeneratedIntColumn get circleId => _circleId ??= _constructCircleId();
  GeneratedIntColumn _constructCircleId() {
    return GeneratedIntColumn(
      'circle_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _wordMeta = const VerificationMeta('word');
  GeneratedTextColumn _word;
  @override
  GeneratedTextColumn get word => _word ??= _constructWord();
  GeneratedTextColumn _constructWord() {
    return GeneratedTextColumn(
      'word',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, circleId, word];
  @override
  $KeywordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'keywords';
  @override
  final String actualTableName = 'keywords';
  @override
  VerificationContext validateIntegrity(KeywordsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.circleId.present) {
      context.handle(_circleIdMeta,
          circleId.isAcceptableValue(d.circleId.value, _circleIdMeta));
    } else if (circleId.isRequired && isInserting) {
      context.missing(_circleIdMeta);
    }
    if (d.word.present) {
      context.handle(
          _wordMeta, word.isAcceptableValue(d.word.value, _wordMeta));
    } else if (word.isRequired && isInserting) {
      context.missing(_wordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Keyword map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Keyword.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(KeywordsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.circleId.present) {
      map['circle_id'] = Variable<int, IntType>(d.circleId.value);
    }
    if (d.word.present) {
      map['word'] = Variable<String, StringType>(d.word.value);
    }
    return map;
  }

  @override
  $KeywordsTable createAlias(String alias) {
    return $KeywordsTable(_db, alias);
  }
}

abstract class _$M3Database extends GeneratedDatabase {
  _$M3Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CirclesTable _circles;
  $CirclesTable get circles => _circles ??= $CirclesTable(this);
  $KeywordsTable _keywords;
  $KeywordsTable get keywords => _keywords ??= $KeywordsTable(this);
  CirclesDao _circlesDao;
  CirclesDao get circlesDao => _circlesDao ??= CirclesDao(this as M3Database);
  @override
  List<TableInfo> get allTables => [circles, keywords];
}
