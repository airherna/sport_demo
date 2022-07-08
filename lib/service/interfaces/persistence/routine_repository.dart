import 'package:sport/domain/routines/routine.dart';

abstract class RoutineRepository {
  Future<Routine> getActiveRoutine();

  void createNewRoutine(Routine routine);
}
