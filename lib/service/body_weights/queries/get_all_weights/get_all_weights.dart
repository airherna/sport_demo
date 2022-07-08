import 'package:sport/domain/body_weights/body_weight.dart';

abstract class GetAllWeigths {
  Future<List<BodyWeight>> execute();
}
