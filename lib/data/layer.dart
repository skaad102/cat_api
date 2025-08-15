import 'package:app_cat_pragma/data/http/rest_client.dart';
import 'package:app_cat_pragma/data/http/rest_interface.dart';

class LayerData {
  LayerData._internal();

  factory LayerData._() => _singleton;

  static final LayerData _singleton = LayerData._internal();

  static LayerData get repository => LayerData._();

  ApiClient get rest => ApiClientImpl();
}
