import 'package:app_cat_pragma/ui/controllers/cats_controller.dart';
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
        title: const Text('Cat Breeds'),
      ),
      body: Obx(() => _buildBody()),
    );
  }

  Widget _buildBody() {
    switch (controller.state.value) {
      case ConnectionState.none:
        return const Center(child: Text('No data'));
      case ConnectionState.waiting:
        return const Center(child: CircularProgressIndicator());
      case ConnectionState.done:
        // return Obx(
        //   () {
        //     if (controller.allGroups.isEmpty) {
        //       return const Center(child: Text('No cats found'));
        //     }
        //     return ListView.builder(
        //       itemCount: controller.allGroups.length,
        //       itemBuilder: (context, index) {
        //         final cat = controller.allGroups[index];
        //         return ListTile(
        //           title: Text(cat.name),
        //           subtitle: Text(cat.breed),
        //         );
        //       },
        //     );
        //   },
        // );
        return Text('Data loaded: ${controller.allGroups.length} cats found');

      case ConnectionState.active:
        return const Center(child: Text('Error loading data'));
    }
  }
}
