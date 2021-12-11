// To parse this JSON data, do
//
//     final scores = scoresFromJson(jsonString);

import 'dart:convert';

Scores scoresFromJson(String str) => Scores.fromJson(json.decode(str));

String scoresToJson(Scores data) => json.encode(data.toJson());

class Scores {
  Scores({
    required this.address,
    required this.coordinates,
    required this.ratings,
    required this.targets,
  });

  Address address;
  Coordinates coordinates;
  Ratings ratings;
  Targets targets;

  factory Scores.fromJson(Map<String, dynamic> json) => Scores(
        address: Address.fromJson(json["address"]),
        coordinates: Coordinates.fromJson(json["coordinates"]),
        ratings: Ratings.fromJson(json["ratings"]),
        targets: Targets.fromJson(json["targets"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "coordinates": coordinates.toJson(),
        "ratings": ratings.toJson(),
        "targets": targets.toJson(),
      };
}

class Address {
  Address({
    required this.buildingNumber,
    required this.street,
  });

  String buildingNumber;
  String street;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        buildingNumber: json["building_number"],
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "building_number": buildingNumber,
        "street": street,
      };
}

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  double latitude;
  double longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Ratings {
  Ratings({
    required this.alkoholStore,
    required this.cafe,
    required this.convenienceShop,
    required this.crimeIndex,
    required this.hipermarket,
    required this.kindergarten,
    required this.postOffice,
    required this.trumStop,
    required this.universitiy,
  });

  int alkoholStore;
  int cafe;
  int convenienceShop;
  int crimeIndex;
  int hipermarket;
  int kindergarten;
  int postOffice;
  int trumStop;
  int universitiy;

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
        alkoholStore: json["Alkohol store"],
        cafe: json["Cafe"],
        convenienceShop: json["Convenience shop"],
        crimeIndex: json["Crime index"],
        hipermarket: json["Hipermarket"],
        kindergarten: json["Kindergarten"],
        postOffice: json["Post office"],
        trumStop: json["Trum stop"],
        universitiy: json["Universitiy"],
      );

  Map<String, dynamic> toJson() => {
        "Alkohol store": alkoholStore,
        "Cafe": cafe,
        "Convenience shop": convenienceShop,
        "Crime index": crimeIndex,
        "Hipermarket": hipermarket,
        "Kindergarten": kindergarten,
        "Post office": postOffice,
        "Trum stop": trumStop,
        "Universitiy": universitiy,
      };
}

class Targets {
  Targets({
    required this.companyFlat,
    required this.couples,
    required this.families,
    required this.single,
    required this.students,
  });

  double companyFlat;
  double couples;
  double families;
  double single;
  double students;

  factory Targets.fromJson(Map<String, dynamic> json) => Targets(
        companyFlat: json["company flat"].toDouble(),
        couples: json["couples"].toDouble(),
        families: json["families"].toDouble(),
        single: json["single"].toDouble(),
        students: json["students"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "company flat": companyFlat,
        "couples": couples,
        "families": families,
        "single": single,
        "students": students,
      };
  Map<String, dynamic> toMap() => {
        "company flat": companyFlat,
        "couples": couples,
        "families": families,
        "single": single,
        "students": students,
      };
}
