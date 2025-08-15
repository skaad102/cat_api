import 'package:app_cat_pragma/domain/extension.dart';

class Weight {
  final String imperial;
  final String metric;

  Weight({
    required this.imperial,
    required this.metric,
  });

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      imperial: json['imperial'] ?? '',
      metric: json['metric'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imperial': imperial,
      'metric': metric,
    };
  }
}

// "id": "0XYvRd7oD",
// "width": 1204,
// "height": 1445,
// "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"
// }
// },
class CatsImage {
  final String id;
  final int width;
  final int height;
  final String url;

  CatsImage.empty()
      : id = '',
        width = 0,
        height = 0,
        url = '';

  CatsImage.fromJson(Map<String, dynamic> json)
      : id = json.getString('id'),
        width = json.getInt('width'),
        height = json.getInt('height'),
        url = json.getString('url');
}

class CatsBreeds {
  final Weight weight;
  final String id;
  final String name;
  final String? cfaUrl;
  final String? vetstreetUrl;
  final String? vcahospitalsUrl;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int lap;
  final String altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final String? wikipediaUrl;
  final int hypoallergenic;
  final String referenceImageId;
  final CatsImage? image;

  CatsBreeds({
    required this.weight,
    required this.id,
    required this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
    required this.image,
  });

  CatsBreeds.empty()
      : weight = Weight(imperial: '', metric: ''),
        id = '',
        cfaUrl = '',
        vcahospitalsUrl = '',
        vetstreetUrl = '',
        name = '',
        temperament = '',
        origin = '',
        countryCodes = '',
        countryCode = '',
        description = '',
        lifeSpan = '',
        indoor = 0,
        lap = 0,
        altNames = '',
        adaptability = 0,
        affectionLevel = 0,
        childFriendly = 0,
        dogFriendly = 0,
        energyLevel = 0,
        grooming = 0,
        healthIssues = 0,
        intelligence = 0,
        sheddingLevel = 0,
        socialNeeds = 0,
        strangerFriendly = 0,
        vocalisation = 0,
        experimental = 0,
        hairless = 0,
        natural = 0,
        rare = 0,
        rex = 0,
        suppressedTail = 0,
        shortLegs = 0,
        wikipediaUrl = null,
        hypoallergenic = 0,
        referenceImageId = '',
        image = CatsImage.empty();

  CatsBreeds.fromJson(Map<String, dynamic> json)
      : id = json.getString('id'),
        weight = Weight.fromJson(json['weight'] ?? {}),
        cfaUrl = json.getString('cfa_url'),
        vcahospitalsUrl = json.getString('vcahospitals_url'),
        vetstreetUrl = json.getString('vetstreet_url'),
        name = json.getString('name'),
        temperament = json.getString('temperament'),
        origin = json.getString('origin'),
        countryCodes = json.getString('country_codes'),
        countryCode = json.getString('country_code'),
        description = json.getString('description'),
        lifeSpan = json.getString('life_span'),
        indoor = json.getInt('indoor'),
        lap = json.getInt('lap'),
        altNames = json.getString('alt_names'),
        adaptability = json.getInt('adaptability'),
        affectionLevel = json.getInt('affection_level'),
        childFriendly = json.getInt('child_friendly'),
        dogFriendly = json.getInt('dog_friendly'),
        energyLevel = json.getInt('energy_level'),
        grooming = json.getInt('grooming'),
        healthIssues = json.getInt('health_issues'),
        intelligence = json.getInt('intelligence'),
        sheddingLevel = json.getInt('shedding_level'),
        socialNeeds = json.getInt('social_needs'),
        strangerFriendly = json.getInt('stranger_friendly'),
        vocalisation = json.getInt('vocalisation'),
        experimental = json.getInt('experimental'),
        hairless = json.getInt('hairless'),
        natural = json.getInt('natural'),
        rare = json.getInt('rare'),
        rex = json.getInt('rex'),
        suppressedTail = json.getInt('suppressed_tail'),
        shortLegs = json.getInt('short_legs'),
        wikipediaUrl = json.getString('wikipedia_url'),
        hypoallergenic = json.getInt('hypoallergenic'),
        referenceImageId = json.getString('reference_image_id'),
        image = CatsImage.fromJson(json['image'] ?? {});
}
