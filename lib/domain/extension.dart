extension MapStringExtension on Map<String, dynamic> {
  String getString(String key, [String? defaultValue]) {
    return this[key] as String? ?? defaultValue ?? '';
  }

  int getInt(String key, [int? defaultValue]) {
    return this[key] as int? ?? defaultValue ?? 0;
  }

  double getDouble(String key, [double? defaultValue]) {
    return this[key] as double? ?? defaultValue ?? 0.0;
  }

  bool getBool(String key, [bool? defaultValue]) {
    return this[key] as bool? ?? defaultValue ?? false;
  }
}
