import 'package:drift/drift.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sport/domain/days/day.dart';
import 'package:sport/domain/exercises/exercise.dart';
import 'package:sport/domain/routines/routine.dart';
import 'package:sport/domain/sets/exercise_set.dart';
import 'package:sport/persistence/repositories/repository.dart';
import 'package:sport/persistence/tables/tables.dart';
import 'package:sport/service/interfaces/persistence/routine_repository.dart';

class RoutineRepositoryImpl extends Repository with RoutineRepository {
  @override
  Future<Routine> getActiveRoutine() async {
/*     final query = db.select(db.routines).join([
      innerJoin(
          db.routineDays, db.routineDays.routineId.equalsExp(db.routines.id)),
      innerJoin(db.dayExercises, db.dayExercises.dayId.equalsExp(db.days.id)),
      innerJoin(
          db.exercises, db.exercises.id.equalsExp(db.dayExercises.exerciseId)),
      innerJoin(db.exerciseSetRelation,
          db.exercises.id.equalsExp(db.exerciseSetRelation.exerciseId)),
      innerJoin(db.sets, db.exerciseSetRelation.setId.equalsExp(db.sets.id)),
    ])
      ..where(db.routines.active);

    final routineStream =
        query.watchSingle().map((event) => event.readTable(db.routines));

    final daysStream = query.watch().map((rows) {
      return rows.map((row) => row.readTable(db.days)).toList();
    });

    final exercisesStream = query.watch().map((rows) {
      return rows.map((row) => row.readTable(db.exercises)).toList();
    });

    final setsStream = query.watch().map((rows) {
      return rows.map((row) => row.readTable(db.sets)).toList();
    });

    final routine = Rx.combineLatest4(
        routineStream, daysStream, exercisesStream, setsStream,
        (RoutineEntity routineEntity, List<DayEntity> days,
            List<ExerciseEntity> exercises, List<SetEntity> sets) {
      return Routine(
          routineEntity.name,
          true,
          days
              .map((e) => Day(
                  e.name,
                  exercises
                      .map((e) => Exercise(
                          e.name,
                          sets
                              .map((e) => ExerciseSet(e.repetitions, e.weight))
                              .toList()))
                      .toList(),
                  List.empty()))
              .toList());
    }).first;

    return routine;
 */
    RoutineEntity entity = await (db.select(db.routines)).getSingle();
    return Routine(entity.id, entity.name, entity.active, []);
  }

  @override
  void createNewRoutine(Routine routine) {
    db.into(db.routines).insert(RoutinesCompanion(
        name: Value(routine.name), active: Value(routine.active)));
  }
}
