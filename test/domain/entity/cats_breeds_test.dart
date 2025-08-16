import 'package:flutter_test/flutter_test.dart';
import 'package:app_cat_pragma/domain/entity/cats_breeds.dart';

void main() {
  group('CatsImage Tests', () {
    test('should create CatsImage from JSON correctly', () {
      // Arrange
      final json = {
        'id': 'test_id',
        'width': 1920,
        'height': 1080,
        'url': 'https://example.com/cat.jpg'
      };

      // Act
      final catsImage = CatsImage.fromJson(json);

      // Assert
      expect(catsImage.id, equals('test_id'));
      expect(catsImage.width, equals(1920));
      expect(catsImage.height, equals(1080));
      expect(catsImage.url, equals('https://example.com/cat.jpg'));
    });

    test('should create empty CatsImage correctly', () {
      // Act
      final catsImage = CatsImage.empty();

      // Assert
      expect(catsImage.id, equals(''));
      expect(catsImage.width, equals(0));
      expect(catsImage.height, equals(0));
      expect(catsImage.url, equals(''));
    });

    test('should handle missing fields in JSON gracefully', () {
      // Arrange
      final json = <String, dynamic>{};

      // Act
      final catsImage = CatsImage.fromJson(json);

      // Assert
      expect(catsImage.id, equals(''));
      expect(catsImage.width, equals(0));
      expect(catsImage.height, equals(0));
      expect(catsImage.url, equals(''));
    });
  });

  group('Weight Tests', () {
    test('should create Weight from JSON correctly', () {
      // Arrange
      final json = {
        'imperial': '7 - 10',
        'metric': '3 - 5'
      };

      // Act
      final weight = Weight.fromJson(json);

      // Assert
      expect(weight.imperial, equals('7 - 10'));
      expect(weight.metric, equals('3 - 5'));
    });

    test('should convert Weight to JSON correctly', () {
      // Arrange
      final weight = Weight(imperial: '7 - 10', metric: '3 - 5');

      // Act
      final json = weight.toJson();

      // Assert
      expect(json['imperial'], equals('7 - 10'));
      expect(json['metric'], equals('3 - 5'));
    });

    test('should handle empty JSON', () {
      // Arrange
      final json = <String, dynamic>{};

      // Act
      final weight = Weight.fromJson(json);

      // Assert
      expect(weight.imperial, equals(''));
      expect(weight.metric, equals(''));
    });
  });
}
