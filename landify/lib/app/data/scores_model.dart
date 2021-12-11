import 'dart:convert';

Scores scoresFromJson(String str) => Scores.fromJson(json.decode(str));

String scoresToJson(Scores data) => json.encode(data.toJson());

class Scores {
  Scores({
    required this.address,
    required this.results,
  });

  Address address;
  Results results;

  factory Scores.fromJson(Map<String, dynamic> json) => Scores(
        address: Address.fromJson(json["address"]),
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "results": results.toJson(),
      };
}

class Address {
  Address({
    required this.buildingNumber,
    this.city = "Łódź",
    this.code = "",
    required this.street,
  });

  String buildingNumber;
  String city;
  String code;
  String street;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        buildingNumber: json["building_number"],
        city: json["city"],
        code: json["code"],
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "building_number": buildingNumber,
        "city": city,
        "code": code,
        "street": street,
      };
}

class Results {
  Results({
    required this.convenience,
    required this.office,
  });

  Convenience convenience;
  Convenience office;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        convenience: Convenience.fromJson(json["convenience"]),
        office: Convenience.fromJson(json["office"]),
      );

  Map<String, dynamic> toJson() => {
        "convenience": convenience.toJson(),
        "office": office.toJson(),
      };
}

class Convenience {
  Convenience({
    required this.reasons,
    required this.score,
  });

  List<String> reasons;
  double score;

  factory Convenience.fromJson(Map<String, dynamic> json) => Convenience(
        reasons: List<String>.from(json["reasons"].map((x) => x)),
        score: json["score"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "reasons": List<dynamic>.from(reasons.map((x) => x)),
        "score": score,
      };
}
