import 'package:app_cat_pragma/domain/repository/cats_breeds_repository.dart';

class CatsBreedsImp implements CatsBreedsRepository {
  @override
  Future<(bool, List<Map<String, dynamic>>)> getBreeds() {
    // TODO: implement getBreeds
    throw UnimplementedError();
  }

  @override
  Future<(bool, Map<String, dynamic>)> getBreedById(String id) {
    // TODO: implement getBreedById
    throw UnimplementedError();
  }
}
