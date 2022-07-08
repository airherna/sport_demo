import 'package:sport/domain/user/user.dart';
import 'package:sport/service/user/queries/get_user/get_user.dart';
import 'package:sport/service/user/queries/get_user/get_user_impl.dart';

class UserController {
  final GetUser getUserQuery = GetUserImpl();

  Future<User> getUser() {
    return getUserQuery.execute();
  }
}
