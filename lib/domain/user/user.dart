import 'package:sport/domain/body_weights/body_weight.dart';

class User {
  double objectiveWeight;
  List<BodyWeight> weightHistory;

  User(this.objectiveWeight, this.weightHistory);
}
