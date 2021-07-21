import 'dart:convert';

class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  factory Sys.fromJson(String str) => Sys.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sys.fromMap(Map<String, dynamic> json) => Sys(
        type: json["type"] ?? 0,
        id: json["id"] ?? 0,
        country: json["country"],
        sunrise: json["sunrise"] ?? 0,
        sunset: json["sunset"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}
