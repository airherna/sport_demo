import 'package:sport/domain/routines/routine.dart';

abstract class GetActiveRoutine {
  Future<Routine> execute();
}
