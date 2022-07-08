import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:sport/domain/body_weights/body_weight.dart';
import 'package:sport/persistence/repositories/repository.dart';
import 'package:sport/persistence/tables/tables.dart';
import 'package:sport/service/interfaces/persistence/body_weights_repository.dart';

class BodyWeightsRepositoryImpl extends Repository with BodyWeightsRepository {
  @override
  Future<List<BodyWeight>> getAll() async {
    return await db
        .select(db.bodyWeights)
        .get()
        .then((value) => value.map((e) => BodyWeight.fromEntity(e)).toList());
  }

  @override
  void writeEntry(BodyWeight newEntry) {
    db.into(db.bodyWeights).insert(BodyWeightsCompanion(
        weight: Value(newEntry.weight),
        date: Value(newEntry.date),
        userId: const Value(1)));
  }
}
