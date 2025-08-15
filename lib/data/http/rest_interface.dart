import 'package:app_cat_pragma/data/http/rest_const.dart';

enum ApiMethod { get, post, put, delete }

abstract class ApiClient {
  Future<(int, T)> call<T extends ApiInternal>({
    required String base,
    required ApiMethod method,
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  });
}
