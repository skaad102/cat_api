import 'package:app_cat_pragma/domain/entity/cats_breeds.dart';
import 'package:flutter/material.dart';

class CatList extends StatelessWidget {
  const CatList({super.key, required this.breeds});
  final List<CatsBreeds> breeds;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 300,
        child: ListView.separated(
          itemCount: breeds.length,
          itemBuilder: (context, index) {
            final cat = breeds[index];
            return ListTile(
              title: Text(cat.name),
              subtitle: Text(cat.description),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8.0),
        ),
      ),
    );
  }
}
