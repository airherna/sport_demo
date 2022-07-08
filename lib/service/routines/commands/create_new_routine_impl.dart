import 'package:get_it/get_it.dart';
import 'package:sport/domain/routines/routine.dart';
import 'package:sport/service/interfaces/persistence/routine_repository.dart';
import 'package:sport/service/routines/commands/create_new_routine.dart';

class CreateNewRoutineImpl extends CreateNewRoutine {
  final RoutineRepository repo;

  CreateNewRoutineImpl() : repo = GetIt.I<RoutineRepository>();

  @override
  void execute(Routine routine) {
    repo.createNewRoutine(routine);
  }
}
