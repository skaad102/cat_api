import 'package:app_cat_pragma/domain/entity/cats_breeds.dart';
import 'package:app_cat_pragma/domain/use_case/get_all_cats_use_case.dart';
import 'package:app_cat_pragma/domain/use_case/get_cat_by_id_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatsController extends GetxController {
  CatsController._();
  static CatsController get instance => Get.find();

  static void initController() {
    Get.lazyPut(CatsController._);
  }

  // HOMEPAGE
  final state = ConnectionState.none.obs;
  final allCats = <CatsBreeds>[].obs;
  final filterCats = <CatsBreeds>[].obs;
  final controllerFilter = TextEditingController();
  final filterText = ''.obs;
  final FocusNode focusNode = FocusNode();
  final _getCats = GetAllCatsUseCaseImpl();

  // DETAILSPAGE
  final _getCatById = GetCatByIdUseCaseImpl();
  final catsImage = <CatsImage>[].obs;

  Future<void> getAllCats() async {
    try {
      if (state.value == ConnectionState.waiting) return;
      state.value = ConnectionState.waiting;
      final (success, cats) = await _getCats.call();
      if (success) {
        allCats.value = cats;
        state.value = ConnectionState.done;
      }
    } finally {
      if (state.value != ConnectionState.done) {
        state.value = ConnectionState.done;
      }
    }
  }

  void onChangeFilter(String value) {
    filterText.value = value;
    if (value.isEmpty) {
      filterCats.assignAll(allCats);
    } else {
      filterCats.assignAll(allCats
          .where((cat) => cat.name.toLowerCase().contains(value.toLowerCase()))
          .toList());
    }
  }

  CatsBreeds getCatById(String id) {
    return allCats.firstWhere((cat) => cat.id == id,
        orElse: () => CatsBreeds.empty());
  }

  Future<(bool, List<CatsImage>?)> getImageCatById(String id,
      {int? limit}) async {
    try {
      final (success, cats) = await _getCatById.call(id, limit);
      final initPhotoCat = getCatById(id).image ?? CatsImage.empty();
      if (success) {
        if (initPhotoCat.id.isEmpty) {
          catsImage.value = cats ?? [];
        } else {
          catsImage.value = [initPhotoCat, ...?cats];
        }
        return (true, cats);
      } else {
        return (false, null);
      }
    } catch (e) {
      return (false, null);
    }
  }
}
