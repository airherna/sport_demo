import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sport/persistence/repositories/days_repository_impl.dart';
import 'package:sport/persistence/repositories/routine_repository_impl.dart';
import 'package:sport/persistence/repositories/user_repository_impl.dart';
import 'package:sport/persistence/tables/tables.dart';
import 'package:sport/persistence/repositories/weights_repository_impl.dart';
import 'package:sport/presentation/my_app.dart';
import 'package:sport/service/interfaces/persistence/body_weights_repository.dart';
import 'package:sport/service/interfaces/persistence/days_repository.dart';
import 'package:sport/service/interfaces/persistence/routine_repository.dart';
import 'package:sport/service/interfaces/persistence/user_repository.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<MyDatabase>(MyDatabase());
  getIt.registerSingleton<BodyWeightsRepository>(BodyWeightsRepositoryImpl());
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
  getIt.registerSingleton<RoutineRepository>(RoutineRepositoryImpl());
  getIt.registerSingleton<DaysRepository>(DaysRepositoryImpl());

  runApp(const MyApp());
}
