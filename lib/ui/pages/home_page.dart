import 'package:app_cat_pragma/ui/controllers/cats_controller.dart';
import 'package:app_cat_pragma/ui/widgets/list_cats.dart';
import 'package:app_cat_pragma/ui/widgets/text_field_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = CatsController.instance;

  @override
  void initState() {
    super.initState();
    controller.getAllCats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cat Breeds'),
      ),
      body: Column(
        children: [
          TextFieldBase(
            controller: controller.controllerFilter.value,
            onChanged: controller.onChangeFilter,
            iconData: Icons.search,
          ),
          Obx(() => _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (controller.state.value) {
      case ConnectionState.none:
        return const Center(child: Text('No data'));
      case ConnectionState.waiting:
        return const Center(child: CircularProgressIndicator());
      case ConnectionState.done:
        if (controller.controllerFilter.value.text.isEmpty) {
          return CatList(breeds: controller.allCats);
        } else {
          return CatList(breeds: controller.filterCats);
        }

      case ConnectionState.active:
        return const Center(child: Text('Error loading data'));
    }
  }
}
