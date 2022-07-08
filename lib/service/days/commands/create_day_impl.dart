import 'package:get_it/get_it.dart';
import 'package:sport/domain/days/day.dart';
import 'package:sport/service/days/commands/create_day.dart';
import 'package:sport/service/interfaces/persistence/days_repository.dart';

class CreateDayImpl extends CreateDay {
  final DaysRepository repo;

  CreateDayImpl() : repo = GetIt.I<DaysRepository>();

  @override
  void execute(Day day) {
    repo.createDay(day);
  }
}
