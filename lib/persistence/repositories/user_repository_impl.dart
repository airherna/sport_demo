import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sport/domain/body_weights/body_weight.dart';
import 'package:sport/domain/user/user.dart';
import 'package:sport/persistence/repositories/repository.dart';
import 'package:sport/persistence/tables/tables.dart';
import 'package:sport/service/interfaces/persistence/user_repository.dart';

class UserRepositoryImpl extends Repository with UserRepository {
  @override
  Future<User> getUser() async {
    UserEntity entity = await db.select(db.users).getSingle();
    List<BodyWeightEntity> weights = await db.select(db.bodyWeights).get();
    debugPrint("$weights");
    return User(entity.objectiveWeight,
        weights.map((e) => BodyWeight.fromEntity(e)).toList());
  }

  @override
  void updateObjectiveWeight(double newObjective) {
    db.into(db.users).insertOnConflictUpdate(
        UserEntity(id: 1, objectiveWeight: newObjective));
  }
}
