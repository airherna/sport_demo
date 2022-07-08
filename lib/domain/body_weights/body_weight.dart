import 'package:sport/persistence/tables/tables.dart';

class BodyWeight {
  double weight;
  DateTime date;

  BodyWeight(this.weight, this.date);

  factory BodyWeight.fromEntity(BodyWeightEntity entity) {
    return BodyWeight(entity.weight, entity.date);
  }

  factory BodyWeight.fromWeight(double weight) {
    return BodyWeight(weight, DateTime.now());
  }
}
