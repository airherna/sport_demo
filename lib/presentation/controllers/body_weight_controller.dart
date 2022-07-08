import 'dart:async';

import 'package:sport/domain/body_weights/body_weight.dart';
import 'package:sport/service/body_weights/commands/register_weight/register_weight.dart';
import 'package:sport/service/body_weights/commands/register_weight/register_weight_impl.dart';
import 'package:sport/service/body_weights/queries/get_all_weights/get_all_weights.dart';
import 'package:sport/service/body_weights/queries/get_all_weights/get_all_weights_impl.dart';
import 'package:sport/service/user/commands/update_objective_weight.dart';
import 'package:sport/service/user/commands/update_objective_weight_impl.dart';

class BodyWeightController {
  final GetAllWeigths _getAllWeightsQuery = GetAllWeightsImpl();
  final RegisterWeight _registerWeightCommand = RegisterWeightImpl();
  final UpdateObjectiveWeight _objectiveWeight = UpdateObjectiveWeightImpl();

  Future<List<BodyWeight>> getAllBodyWeights() async {
    return _getAllWeightsQuery.execute();
  }

  void writeWeight(BodyWeight bodyWeight) {
    _registerWeightCommand.execute(bodyWeight);
  }

  void updateObjectiveWeight(double newObjective) {
    _objectiveWeight.execute(newObjective);
  }
}
