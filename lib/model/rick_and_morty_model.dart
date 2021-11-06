import 'dart:convert';

class RickMortyModel {
  RickMortyModel({
    required this.info,
    required this.results,
  });

  Info info;
  List<Character> results;

  factory RickMortyModel.fromJson(String str) =>
      RickMortyModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RickMortyModel.fromMap(Map<String, dynamic> json) => RickMortyModel(
        info: Info.fromMap(json["info"]),
        results: List<Character>.from(
            json["results"].map((x) => Character.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  int count;
  int pages;
  String next;
  dynamic prev;

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}

class Character {
  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  int id;
  String name;
  String status;
  String species;
  // Species species;
  String type;
  // Gender gender;
  String gender;
  LocationRAM origin;
  LocationRAM location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(other) {
    if (other is! Character) {
      return false;
    }
    return id == (other).id;
  }

  late int _hashCode;
  @override
  int get hashCode {
    _hashCode;
    return _hashCode;
  }

 

  factory Character.fromMap(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        // species: speciesValues.map[json["species"]]!,
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        // gender: genderValues.map[json["gender"]]!,
        origin: LocationRAM.fromMap(json["origin"]),
        location: LocationRAM.fromMap(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "status": status,
        // "species": speciesValues.reverse[species],
        "species": species,
        "type": type,
        "gender": gender,
        // "gender": genderValues.reverse[gender],
        "origin": origin.toMap(),
        "location": location.toMap(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}

// enum Gender { MALE, FEMALE, UNKNOWN }

// final genderValues = EnumValues({
//     "Female": Gender.FEMALE,
//     "Male": Gender.MALE,
//     "unknown": Gender.UNKNOWN
// });

class LocationRAM {
  LocationRAM({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory LocationRAM.fromJson(String str) =>
      LocationRAM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocationRAM.fromMap(Map<String, dynamic> json) => LocationRAM(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

// enum Species { HUMAN, ALIEN }

// final speciesValues = EnumValues({
//     "Alien": Species.ALIEN,
//     "Human": Species.HUMAN
// });

// enum Status { ALIVE, UNKNOWN, DEAD }

// final statusValues = EnumValues({
//     "Alive": Status.ALIVE,
//     "Dead": Status.DEAD,
//     "unknown": Status.UNKNOWN
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
