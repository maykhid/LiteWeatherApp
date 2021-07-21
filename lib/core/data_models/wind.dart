import 'dart:convert';

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    this.gust,
  });

  final double speed;
  final int deg;
  int? gust;

  factory Wind.fromJson(String str) => Wind.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        // gust: json["gust"].toInt(),
      );

  Map<String, dynamic> toMap() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
