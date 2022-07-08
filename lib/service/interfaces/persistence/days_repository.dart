import 'package:sport/domain/days/day.dart';

abstract class DaysRepository {
  Future<List<Day>> getDaysFromRoutine(int routineId);

  void createDay(Day day);
}
