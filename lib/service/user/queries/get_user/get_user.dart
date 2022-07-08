import 'package:sport/domain/user/user.dart';

abstract class GetUser {
  Future<User> execute();
}
