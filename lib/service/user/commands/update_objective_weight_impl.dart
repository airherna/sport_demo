import 'package:get_it/get_it.dart';
import 'package:sport/service/interfaces/persistence/user_repository.dart';
import 'package:sport/service/user/commands/update_objective_weight.dart';

class UpdateObjectiveWeightImpl extends UpdateObjectiveWeight {
  final UserRepository repo;

  UpdateObjectiveWeightImpl() : repo = GetIt.I<UserRepository>();

  @override
  void execute(double newObjective) {
    repo.updateObjectiveWeight(newObjective);
  }
}
