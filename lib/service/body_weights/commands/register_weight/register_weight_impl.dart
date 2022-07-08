import 'package:get_it/get_it.dart';
import 'package:sport/domain/body_weights/body_weight.dart';
import 'package:sport/persistence/tables/tables.dart';
import 'package:sport/service/body_weights/commands/register_weight/register_weight.dart';
import 'package:sport/service/interfaces/persistence/body_weights_repository.dart';

class RegisterWeightImpl implements RegisterWeight {
  final BodyWeightsRepository repo;

  RegisterWeightImpl() : repo = GetIt.I<BodyWeightsRepository>();

  @override
  void execute(BodyWeight bodyWeight) {
    repo.writeEntry(bodyWeight);
  }
}
