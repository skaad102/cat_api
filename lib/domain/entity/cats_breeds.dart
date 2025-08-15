// [
// {
// weight: {
// imperial: "7  -  10",
// metric: "3 - 5"
// },
// id: "abys",
// name: "Abyssinian",
// cfa_url: "http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx",
// vetstreet_url: "http://www.vetstreet.com/cats/abyssinian",
// vcahospitals_url: "https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
// temperament: "Active, Energetic, Independent, Intelligent, Gentle",
// origin: "Egypt",
// country_codes: "EG",
// country_code: "EG",
// description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
// life_span: "14 - 15",
// indoor: 0,
// lap: 1,
// alt_names: "",
// adaptability: 5,
// affection_level: 5,
// child_friendly: 3,
// dog_friendly: 4,
// energy_level: 5,
// grooming: 1,
// health_issues: 2,
// intelligence: 5,
// shedding_level: 2,
// social_needs: 5,
// stranger_friendly: 5,
// vocalisation: 1,
// experimental: 0,
// hairless: 0,
// natural: 1,
// rare: 0,
// rex: 0,
// suppressed_tail: 0,
// short_legs: 0,
// wikipedia_url: "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
// hypoallergenic: 0,
// reference_image_id: "0XYvRd7oD"
// },
// {
// weight: {
// imperial: "7 - 10",
// metric: "3 - 5"
// },
// id: "aege",
// name: "Aegean",
// vetstreet_url: "http://www.vetstreet.com/cats/aegean-cat",

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
        referenceImageId = '';

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
        referenceImageId = json.getString('reference_image_id');
}
