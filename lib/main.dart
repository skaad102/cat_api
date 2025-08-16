import 'package:app_cat_pragma/ui/main/controllers.dart';
import 'package:app_cat_pragma/ui/main/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  initControllers();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      routeInformationParser: CatRoutes.instance.routes.routeInformationParser,
      routerDelegate: CatRoutes.instance.routes.routerDelegate,
      routeInformationProvider:
          CatRoutes.instance.routes.routeInformationProvider,
    );
  }
}
