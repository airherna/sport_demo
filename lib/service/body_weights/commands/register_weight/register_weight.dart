import 'package:sport/domain/body_weights/body_weight.dart';
import 'package:sport/service/interfaces/persistence/body_weights_repository.dart';

abstract class RegisterWeight {
  void execute(BodyWeight bodyWeight);
}
