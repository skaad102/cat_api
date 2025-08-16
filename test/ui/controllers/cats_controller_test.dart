import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:app_cat_pragma/ui/controllers/cats_controller.dart';
import 'package:app_cat_pragma/domain/entity/cats_breeds.dart';

void main() {
  group('CatsController Tests', () {
    late CatsController controller;

    setUp(() {
      // Inicializar GetX para las pruebas
      Get.testMode = true;
      CatsController.initController();
      controller = CatsController.instance;
    });

    tearDown(() {
      Get.reset();
    });

    test('should filter cats correctly by name', () {
      // Arrange
      final testCats = [
        CatsBreeds(
          weight: Weight(imperial: '7-10', metric: '3-5'),
          id: 'abys',
          name: 'Abyssinian',
          cfaUrl: '',
          vetstreetUrl: '',
          vcahospitalsUrl: '',
          temperament: 'Active, Energetic',
          origin: 'Egypt',
          countryCodes: 'EG',
          countryCode: 'EG',
          description: 'Test description',
          lifeSpan: '14 - 15',
          indoor: 0,
          lap: 1,
          altNames: '',
          adaptability: 5,
          affectionLevel: 5,
          childFriendly: 3,
          dogFriendly: 4,
          energyLevel: 5,
          grooming: 1,
          healthIssues: 2,
          intelligence: 5,
          sheddingLevel: 2,
          socialNeeds: 5,
          strangerFriendly: 5,
          vocalisation: 1,
          experimental: 0,
          hairless: 0,
          natural: 1,
          rare: 0,
          rex: 0,
          suppressedTail: 0,
          shortLegs: 0,
          wikipediaUrl: '',
          hypoallergenic: 0,
          referenceImageId: '',
          image: CatsImage.empty(),
        ),
        CatsBreeds(
          weight: Weight(imperial: '6-12', metric: '3-5'),
          id: 'beng',
          name: 'Bengal',
          cfaUrl: '',
          vetstreetUrl: '',
          vcahospitalsUrl: '',
          temperament: 'Alert, Agile',
          origin: 'United States',
          countryCodes: 'US',
          countryCode: 'US',
          description: 'Test description',
          lifeSpan: '14 - 16',
          indoor: 0,
          lap: 1,
          altNames: '',
          adaptability: 5,
          affectionLevel: 5,
          childFriendly: 4,
          dogFriendly: 5,
          energyLevel: 5,
          grooming: 1,
          healthIssues: 3,
          intelligence: 5,
          sheddingLevel: 3,
          socialNeeds: 5,
          strangerFriendly: 5,
          vocalisation: 5,
          experimental: 0,
          hairless: 0,
          natural: 0,
          rare: 0,
          rex: 0,
          suppressedTail: 0,
          shortLegs: 0,
          wikipediaUrl: '',
          hypoallergenic: 0,
          referenceImageId: '',
          image: CatsImage.empty(),
        ),
      ];

      controller.allCats.assignAll(testCats);

      // Act
      controller.onChangeFilter('Abys');

      // Assert
      expect(controller.filterCats.length, equals(1));
      expect(controller.filterCats.first.name, equals('Abyssinian'));
      expect(controller.filterText.value, equals('Abys'));
    });

    test('should return all cats when filter is empty', () {
      // Arrange
      final testCats = [
        CatsBreeds.empty(),
        CatsBreeds.empty(),
      ];
      controller.allCats.assignAll(testCats);

      // Act
      controller.onChangeFilter('');

      // Assert
      expect(controller.filterCats.length, equals(2));
      expect(controller.filterText.value, equals(''));
    });

    test('should filter cats case insensitive', () {
      // Arrange
      final testCats = [
        CatsBreeds(
          weight: Weight(imperial: '7-10', metric: '3-5'),
          id: 'abys',
          name: 'Abyssinian',
          cfaUrl: '',
          vetstreetUrl: '',
          vcahospitalsUrl: '',
          temperament: 'Active',
          origin: 'Egypt',
          countryCodes: 'EG',
          countryCode: 'EG',
          description: 'Test',
          lifeSpan: '14-15',
          indoor: 0,
          lap: 1,
          altNames: '',
          adaptability: 5,
          affectionLevel: 5,
          childFriendly: 3,
          dogFriendly: 4,
          energyLevel: 5,
          grooming: 1,
          healthIssues: 2,
          intelligence: 5,
          sheddingLevel: 2,
          socialNeeds: 5,
          strangerFriendly: 5,
          vocalisation: 1,
          experimental: 0,
          hairless: 0,
          natural: 1,
          rare: 0,
          rex: 0,
          suppressedTail: 0,
          shortLegs: 0,
          wikipediaUrl: '',
          hypoallergenic: 0,
          referenceImageId: '',
          image: CatsImage.empty(),
        ),
      ];
      controller.allCats.assignAll(testCats);

      // Act
      controller.onChangeFilter('ABYS');

      // Assert
      expect(controller.filterCats.length, equals(1));
      expect(controller.filterCats.first.name, equals('Abyssinian'));
    });

    test('should return empty list when no matches found', () {
      // Arrange
      final testCats = [
        CatsBreeds(
          weight: Weight(imperial: '7-10', metric: '3-5'),
          id: 'abys',
          name: 'Abyssinian',
          cfaUrl: '',
          vetstreetUrl: '',
          vcahospitalsUrl: '',
          temperament: 'Active',
          origin: 'Egypt',
          countryCodes: 'EG',
          countryCode: 'EG',
          description: 'Test',
          lifeSpan: '14-15',
          indoor: 0,
          lap: 1,
          altNames: '',
          adaptability: 5,
          affectionLevel: 5,
          childFriendly: 3,
          dogFriendly: 4,
          energyLevel: 5,
          grooming: 1,
          healthIssues: 2,
          intelligence: 5,
          sheddingLevel: 2,
          socialNeeds: 5,
          strangerFriendly: 5,
          vocalisation: 1,
          experimental: 0,
          hairless: 0,
          natural: 1,
          rare: 0,
          rex: 0,
          suppressedTail: 0,
          shortLegs: 0,
          wikipediaUrl: '',
          hypoallergenic: 0,
          referenceImageId: '',
          image: CatsImage.empty(),
        ),
      ];
      controller.allCats.assignAll(testCats);

      // Act
      controller.onChangeFilter('NonExistentCat');

      // Assert
      expect(controller.filterCats.length, equals(0));
    });

    test('should find cat by id correctly', () {
      // Arrange
      final testCats = [
        CatsBreeds(
          weight: Weight(imperial: '7-10', metric: '3-5'),
          id: 'abys',
          name: 'Abyssinian',
          cfaUrl: '',
          vetstreetUrl: '',
          vcahospitalsUrl: '',
          temperament: 'Active',
          origin: 'Egypt',
          countryCodes: 'EG',
          countryCode: 'EG',
          description: 'Test',
          lifeSpan: '14-15',
          indoor: 0,
          lap: 1,
          altNames: '',
          adaptability: 5,
          affectionLevel: 5,
          childFriendly: 3,
          dogFriendly: 4,
          energyLevel: 5,
          grooming: 1,
          healthIssues: 2,
          intelligence: 5,
          sheddingLevel: 2,
          socialNeeds: 5,
          strangerFriendly: 5,
          vocalisation: 1,
          experimental: 0,
          hairless: 0,
          natural: 1,
          rare: 0,
          rex: 0,
          suppressedTail: 0,
          shortLegs: 0,
          wikipediaUrl: '',
          hypoallergenic: 0,
          referenceImageId: '',
          image: CatsImage.empty(),
        ),
      ];
      controller.allCats.assignAll(testCats);

      // Act
      final foundCat = controller.getCatById('abys');

      // Assert
      expect(foundCat.id, equals('abys'));
      expect(foundCat.name, equals('Abyssinian'));
    });

    test('should return empty cat when id not found', () {
      // Arrange
      controller.allCats.assignAll([]);

      // Act
      final foundCat = controller.getCatById('nonexistent');

      // Assert
      expect(foundCat.id, equals(''));
      expect(foundCat.name, equals(''));
    });
  });
}
