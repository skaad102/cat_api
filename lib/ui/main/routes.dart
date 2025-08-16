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
            name: page.name,
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
  void goTo(CatPage route,
      {Map<String, String>? queryParams, Map<String, String>? pathParams}) {
    final dataQueryParams = queryParams ?? {};
    final dataPathParams = pathParams ?? {};
    GoRouter.of(this).pushNamed(route.name,
        queryParameters: dataQueryParams, pathParameters: dataPathParams);
  }

  void replaceTo(CatPage route, {Map<String, String>? queryParams}) {
    final dataQueryParams = queryParams ?? {};
    GoRouter.of(this)
        .replaceNamed(route.name, queryParameters: dataQueryParams);
  }
}
