import 'package:sport/domain/days/day.dart';

class Routine {
  int id;
  String name;
  bool active;
  List<Day> days;

  Routine(this.id, this.name, this.active, this.days);

  factory Routine.withName(String name) {
    return Routine(-1, name, true, []);
  }
}
