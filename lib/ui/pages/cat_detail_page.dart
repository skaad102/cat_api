import 'package:flutter/material.dart';

class CatDetailPage extends StatelessWidget {
  final String catId;

  const CatDetailPage({super.key, required this.catId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Detail - $catId'),
      ),
      body: Center(
        child: Text('Details for cat $catId'),
      ),
    );
  }
}
