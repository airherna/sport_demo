import 'package:get_it/get_it.dart';
import 'package:sport/domain/user/user.dart';
import 'package:sport/service/interfaces/persistence/body_weights_repository.dart';
import 'package:sport/service/interfaces/persistence/user_repository.dart';
import 'package:sport/service/user/queries/get_user/get_user.dart';

class GetUserImpl extends GetUser {
  final UserRepository repo;

  GetUserImpl() : repo = GetIt.I<UserRepository>();

  @override
  Future<User> execute() {
    return repo.getUser();
  }
}
