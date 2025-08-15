abstract class CatsBreedsRepository {
  Future<(bool, List<Map<String, dynamic>>)> getBreeds();
  Future<(bool, Map<String, dynamic>)> getBreedById(String id);
}
