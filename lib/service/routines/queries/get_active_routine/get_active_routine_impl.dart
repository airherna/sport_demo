import 'package:get_it/get_it.dart';
import 'package:sport/domain/routines/routine.dart';
import 'package:sport/service/interfaces/persistence/routine_repository.dart';
import 'package:sport/service/routines/queries/get_active_routine/get_active_routine.dart';

class GetActiveRoutineImpl implements GetActiveRoutine {
  final RoutineRepository repo;

  GetActiveRoutineImpl() : repo = GetIt.I<RoutineRepository>();

  @override
  Future<Routine> execute() {
    return repo.getActiveRoutine();
  }
}
