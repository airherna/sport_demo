import 'package:get_it/get_it.dart';
import 'package:sport/domain/user/user.dart';
import 'package:sport/persistence/tables/tables.dart';

abstract class UserRepository {
  Future<User> getUser();

  void updateObjectiveWeight(double newObjective);
}
