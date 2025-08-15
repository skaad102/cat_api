import 'package:app_cat_pragma/ui/main/controllers.dart';
import 'package:app_cat_pragma/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  initControllers();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: Scaffold(
      //   body: Center(
      //     child: Text('Hello World!'),
      //   ),
      // ),
      home: HomePage(),
    );
  }
}
