import 'package:sport/common/date_utils/day_of_week.dart';
import 'package:sport/domain/exercises/exercise.dart';

class Day {
  String name;
  List<Exercise> exercises;
  List<DayOfWeek> days;

  Day(this.name, this.exercises, this.days);
}
