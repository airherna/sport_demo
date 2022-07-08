import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'tables.g.dart';

@DataClassName("RoutineEntity")
class Routines extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get active => boolean()();
}

class RoutineDays extends Table {
  IntColumn get routineId => integer().references(Routines, #id)();
  IntColumn get dayId => integer().references(Days, #id)();

  @override
  get primaryKey => {routineId, dayId};
}

@DataClassName("DayEntity")
class Days extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get daysOfWeek => text()();
}

class DayExercises extends Table {
  IntColumn get dayId => integer().references(Days, #id)();
  IntColumn get exerciseId => integer().references(Exercises, #id)();

  @override
  get primaryKey => {dayId, exerciseId};
}

@DataClassName("ExerciseEntity")
class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get sets => integer()();
  IntColumn get repetitions => integer()();
  RealColumn get weight => real()();
}

@DataClassName("UserEntity")
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get objectiveWeight => real()();
}

@DataClassName("BodyWeightEntity")
class BodyWeights extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get weight => real()();
  IntColumn get userId => integer()();
  DateTimeColumn get date => dateTime()();
}

@DriftDatabase(tables: [
  Routines,
  RoutineDays,
  Days,
  DayExercises,
  Exercises,
  Users,
  BodyWeights
])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 7;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (m) async {
      await m.createAll();
      await into(users).insert(UserEntity(id: 1, objectiveWeight: 0));
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
