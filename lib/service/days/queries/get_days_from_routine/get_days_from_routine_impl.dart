import 'package:get_it/get_it.dart';
import 'package:sport/domain/days/day.dart';
import 'package:sport/service/days/queries/get_days_from_routine/get_days_from_routine.dart';
import 'package:sport/service/interfaces/persistence/days_repository.dart';

class GetDaysFromRoutineImpl extends GetDaysFromRoutine {
  final DaysRepository repo;

  GetDaysFromRoutineImpl() : repo = GetIt.I<DaysRepository>();

  @override
  Future<List<Day>> execute(int routineId) {
    return repo.getDaysFromRoutine(routineId);
  }
}
