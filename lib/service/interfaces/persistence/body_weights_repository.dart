import 'package:sport/domain/body_weights/body_weight.dart';

abstract class BodyWeightsRepository {
  Future<List<BodyWeight>> getAll();

  void writeEntry(BodyWeight newEntry);
}
