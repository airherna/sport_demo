import 'package:sport/domain/days/day.dart';

abstract class GetDaysFromRoutine {
  Future<List<Day>> execute(int routineId);
}
