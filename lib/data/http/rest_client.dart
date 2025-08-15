import 'dart:convert';

import 'package:app_cat_pragma/data/http/rest_const.dart';
import 'package:app_cat_pragma/data/http/rest_interface.dart';
import 'package:http/http.dart' as http;

class ApiClientImpl extends ApiClient {
  @override
  Future<(int, T)> call<T extends ApiInternal>(
      {required String base,
      required ApiMethod method,
      required String path,
      Map<String, dynamic>? data,
      String? token,
      Map<String, dynamic>? queryParameters}) async {
    late Future<http.Response> request;
    final uri = Uri.parse('$base$path');

    switch (method) {
      case ApiMethod.get:
        request = http.get(
          uri,
          headers: {
            'Content-Type': 'application/json',
            'x-api-key':
                'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr' // TODO: Move to save
          },
        );
        break;
      case ApiMethod.post:
        throw Exception('POST method not implemented');
      case ApiMethod.put:
        throw Exception('PUT method not implemented');
      case ApiMethod.delete:
        throw Exception('DELETE method not implemented');
    }

    try {
      final response = await request;
      final statusCode = response.statusCode;
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      late ApiInternal responseData;

      if (T == ApiMap) {
        final mapResponse = jsonResponse as Map<String, dynamic>;
        responseData = ApiMap.fromMap(mapResponse);
      } else if (T == ApiList) {
        final listResponse = jsonResponse as List<dynamic>;
        responseData = ApiList.fromList(listResponse);
      } else {
        throw Exception('Unsupported type: $T');
      }

      return (statusCode, responseData as T);
    } catch (e) {
      rethrow;
    }
  }
}
