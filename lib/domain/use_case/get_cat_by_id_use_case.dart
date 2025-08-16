import 'package:app_cat_pragma/data/repository/cast_breads_imp.dart';
import 'package:app_cat_pragma/domain/entity/cats_breeds.dart';

mixin GetCatByIdUseCase {
  Future<(bool, List<CatsImage>?)> call(String id, int? limit);
}

class GetCatByIdUseCaseImpl with GetCatByIdUseCase {
  final repository = CatsBreedsImp();

  @override
  Future<(bool, List<CatsImage>?)> call(String id, int? limit) async {
    try {
      final response = await repository.getBreedById(id, limit ?? 10);

      final catsImage = response.$2
          .map((imageJson) => CatsImage.fromJson(imageJson))
          .toList();

      return (true, catsImage);
    } catch (e) {
      return (false, null);
    }
  }
}
