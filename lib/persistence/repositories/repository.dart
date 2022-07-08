import 'package:get_it/get_it.dart';
import 'package:sport/persistence/tables/tables.dart';

abstract class Repository {
  final MyDatabase db;

  Repository() : db = GetIt.I<MyDatabase>();
}
