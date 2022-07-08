import 'package:sport/domain/routines/routine.dart';
import 'package:sport/service/routines/commands/create_new_routine.dart';
import 'package:sport/service/routines/commands/create_new_routine_impl.dart';
import 'package:sport/service/routines/queries/get_active_routine/get_active_routine.dart';
import 'package:sport/service/routines/queries/get_active_routine/get_active_routine_impl.dart';

class RoutineController {
  final GetActiveRoutine _getActiveRoutine = GetActiveRoutineImpl();
  final CreateNewRoutine _createNewRoutine = CreateNewRoutineImpl();

  Future<Routine> getActiveRoutine() {
    return _getActiveRoutine.execute();
  }

  void createDefaultRoutine(String name) {
    _createNewRoutine.execute(Routine.withName(name));
  }
}
