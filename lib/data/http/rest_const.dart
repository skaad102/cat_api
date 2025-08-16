class ApiPath {
  const ApiPath._();

  static const String baseUrl = 'https://api.thecatapi.com/v1';

  // ignore: library_private_types_in_public_api
  static _Cats cats = _Cats._();
}

class _Cats {
  const _Cats._();

  String get base => '/';
  String get breeds => '/breeds';
  String get breedById => '/images/search?limit=:limit&breed_ids=:id';
}

// Abstract class to represent API responses
abstract class ApiInternal {}

class ApiMap extends ApiInternal {
  ApiMap.empty(String? description) : _map = {'error': description};

  ApiMap.fromMap(Map<String, dynamic> value) : _map = value;

  final Map<String, dynamic> _map;

  Map<String, dynamic> toMap() {
    return _map;
  }

  @override
  String toString() {
    return '$_map';
  }
}

class ApiList extends ApiInternal {
  ApiList.empty() : _list = [];

  ApiList.fromList(List<dynamic> value)
      : _list = value.map((e) => e as Map<String, dynamic>).toList();

  final List<Map<String, dynamic>> _list;

  List<Map<String, dynamic>> toList() {
    return _list;
  }

  @override
  String toString() {
    return '$_list';
  }
}
