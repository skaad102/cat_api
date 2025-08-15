import 'package:app_cat_pragma/domain/entity/cats_breeds.dart';
import 'package:app_cat_pragma/domain/use_case/get_all_cats_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatsController extends GetxController {
  CatsController._();
  static CatsController get instance => Get.find();

  static void initController() {
    Get.lazyPut(CatsController._);
  }

  final state = ConnectionState.none.obs;
  final allCats = <CatsBreeds>[].obs;

  final _getCats = GetAllCatsUseCaseImpl();

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
}
