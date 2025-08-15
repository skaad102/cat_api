import 'dart:developer';

import 'package:app_cat_pragma/data/repository/cast_breads_imp.dart';
import 'package:app_cat_pragma/domain/entity/cats_breeds.dart';

mixin GetAllCatsUseCase {
  Future<(bool, List<CatsBreeds>)> call();
}

class GetAllCatsUseCaseImpl implements GetAllCatsUseCase {
  final repository = CatsBreedsImp();

  @override
  Future<(bool, List<CatsBreeds>)> call() async {
    try {
      final result = await repository.getBreeds();
      final listCats =
          result.$2.map((json) => CatsBreeds.fromJson(json)).toList();
      return (true, listCats);
    } catch (e) {
      log("Error fetching cat breeds: $e");
      return (false, <CatsBreeds>[]);
    }
  }
}
