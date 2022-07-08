import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:sport/common/date_utils/day_of_week.dart';
import 'package:sport/domain/days/day.dart';
import 'package:sport/persistence/repositories/repository.dart';
import 'package:sport/persistence/tables/tables.dart';
import 'package:sport/service/interfaces/persistence/days_repository.dart';

class DaysRepositoryImpl extends Repository with DaysRepository {
  @override
  Future<List<Day>> getDaysFromRoutine(int routineId) async {
    final query = await (db.select(db.days).join([
      leftOuterJoin(db.routineDays, db.routineDays.dayId.equalsExp(db.days.id))
    ])
          ..where(db.routineDays.routineId.equals(routineId)))
        .get();

    debugPrint("$query");

    List<DayEntity> entities = query.map((row) {
      return row.readTable(db.days);
    }).toList();

    debugPrint("$entities");

    return entities
        .map((e) => Day(
            e.name,
            [],
            e.daysOfWeek
                .split(',')
                .map((string) =>
                    DayOfWeek.values.firstWhere((e) => e.toString() == string))
                .toList()))
        .toList();
  }

  void createDay(Day day) {
    for (final exercise in day.exercises) {
      db.into(db.exercises).insert(ExercisesCompanion(
          name: Value(exercise.name),
          sets: Value(exercise.sets),
          weight: Value(exercise.weight),
          repetitions: Value(exercise.repetitions)));
    }
  }
}
