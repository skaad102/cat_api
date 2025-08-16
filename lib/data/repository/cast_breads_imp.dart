import 'package:app_cat_pragma/data/http/rest_const.dart';
import 'package:app_cat_pragma/data/http/rest_interface.dart';
import 'package:app_cat_pragma/data/layer.dart';
import 'package:app_cat_pragma/domain/repository/cats_breeds_repository.dart';

class CatsBreedsImp implements CatsBreedsRepository {
  final repository = LayerData.repository;

  @override
  Future<(bool, List<Map<String, dynamic>>)> getBreeds() async {
    final response = await repository.rest.call<ApiList>(
      base: ApiPath.baseUrl,
      method: ApiMethod.get,
      path: ApiPath.cats.breeds,
    );

    if (response.$1 != 200) {
      return (
        false,
        [
          {"error": "Failed to fetch cat breeds"}
        ]
      );
    }

    final result = response.$2.toList();

    return (true, result);
  }

  @override
  Future<(bool, List<Map<String, dynamic>>)> getBreedById(
      String id, int? limit) async {
    final path = ApiPath.cats.breedById
        .replaceAll(':id', id)
        .replaceAll(':limit', limit.toString());
    final response = await repository.rest.call<ApiList>(
      base: ApiPath.baseUrl,
      method: ApiMethod.get,
      path: path,
    );

    if (response.$1 != 200) {
      return (
        false,
        [
          {"error": "Failed to fetch cat breed by id"}
        ]
      );
    }

    return (true, response.$2.toList());
  }
}
