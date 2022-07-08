import 'package:sport/domain/days/day.dart';
import 'package:sport/service/days/commands/create_day.dart';
import 'package:sport/service/days/commands/create_day_impl.dart';
import 'package:sport/service/days/queries/get_days_from_routine/get_days_from_routine.dart';
import 'package:sport/service/days/queries/get_days_from_routine/get_days_from_routine_impl.dart';

class DaysController {
  final GetDaysFromRoutine _getDaysFromRoutine = GetDaysFromRoutineImpl();
  final CreateDay _createDay = CreateDayImpl();

  Future<List<Day>> getDaysFromRoutine(int routineId) {
    return _getDaysFromRoutine.execute(routineId);
  }

  void createDay(Day day) {
    _createDay.execute(day);
  }
}
