import 'package:get_it/get_it.dart';
import 'package:sport/domain/body_weights/body_weight.dart';
import 'package:sport/service/body_weights/queries/get_all_weights/get_all_weights.dart';
import 'package:sport/service/interfaces/persistence/body_weights_repository.dart';

class GetAllWeightsImpl implements GetAllWeigths {
  final BodyWeightsRepository repo;

  GetAllWeightsImpl() : repo = GetIt.I<BodyWeightsRepository>();

  @override
  Future<List<BodyWeight>> execute() {
    return repo.getAll();
  }
}
