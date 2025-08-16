import 'package:app_cat_pragma/ui/main/page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CatRoutes {
  late GoRouter routes;

  static final CatRoutes _singleton = CatRoutes._internal();
  static CatRoutes get instance => _singleton;

  CatRoutes._internal() {
    routes = GoRouter(
      routes: [
        for (final page in CatPage.pages)
          GoRoute(
            path: page.route,
            builder: (context, state) {
              final pathParams = state.pathParameters;
              final queryParams = state.uri.queryParameters;
              return page.builder(pathParams, queryParams);
            },
          ),
      ],
    );
  }
}

extension RouteExtension on BuildContext {
  void goTo(CatPage route) => GoRouter.of(this).go(route.route);
  void replaceTo(CatPage route) => GoRouter.of(this).replace(route.route);
}
