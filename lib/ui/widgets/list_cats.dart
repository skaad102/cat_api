import 'package:app_cat_pragma/ui/controllers/cats_controller.dart';
import 'package:app_cat_pragma/ui/main/page.dart';
import 'package:app_cat_pragma/ui/main/routes.dart';
import 'package:app_cat_pragma/ui/widgets/card_cat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatList extends StatelessWidget {
  CatList({super.key});
  final controller = CatsController.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final breeds = controller.controllerFilter.value.text.isEmpty
          ? controller.allCats.value
          : controller.filterCats.value;
      return Expanded(
        child: SizedBox(
          height: 300,
          child: ListView.separated(
            itemCount: breeds.length,
            itemBuilder: (context, index) {
              final cat = breeds[index];
              return GestureDetector(
                onTap: () {
                  controller.focusNode.unfocus();
                  context.goTo(CatPage.detail, queryParams: {'id': cat.id});
                },
                child: CardCat(breeds: cat),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8.0),
          ),
        ),
      );
    });
  }
}
