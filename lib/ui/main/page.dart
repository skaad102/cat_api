import 'package:app_cat_pragma/ui/pages/cat_detail_page.dart';
import 'package:app_cat_pragma/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

typedef RouteBuilder = Widget Function(RouteOption options);

class RouteOption {
  RouteOption(this.pathParams, this.queryParams);

  final Map<String, String> pathParams;
  final Map<String, String> queryParams;
}

abstract class RouteInterface {
  RouteInterface._(
    this._pageBuilder, {
    required this.name,
    required this.route,
  });

  final String name;
  final String route;
  final RouteBuilder _pageBuilder;

  Widget builder(
    Map<String, String> pathParams,
    Map<String, String> queryParams,
  ) {
    return _pageBuilder(RouteOption(pathParams, queryParams));
  }
}

class CatPage extends RouteInterface {
  CatPage._({
    required String name,
    required String route,
    required RouteBuilder page,
  }) : super._(page, name: name, route: route);

  static final home = CatPage._(
    name: 'home',
    route: '/',
    page: (options) => const HomePage(),
  );

  static final detail = CatPage._(
    name: 'cat_detail',
    route: '/home/:id',
    page: (options) {
      final id = options.pathParams['id'] ?? '';
      return CatDetailPage(catId: id);
    },
  );

  static final pages = [
    home,
    detail,
  ];
}

