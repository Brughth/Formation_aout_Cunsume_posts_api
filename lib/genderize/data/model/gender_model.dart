import 'dart:convert';

class GenderModel {
  final String name;
  final String gender;
  final double probability;
  final int count;
  GenderModel({
    required this.name,
    required this.gender,
    required this.probability,
    required this.count,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'gender': gender});
    result.addAll({'probability': probability});
    result.addAll({'count': count});

    return result;
  }

  factory GenderModel.fromMap(Map<String, dynamic> map) {
    return GenderModel(
      name: map['name'] ?? '',
      gender: map['gender'] ?? '',
      probability: map['probability']?.toDouble() ?? 0.0,
      count: map['count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenderModel.fromJson(String source) =>
      GenderModel.fromMap(json.decode(source));
}

// {
// "name": "espoir",
// "gender": "male",
// "probability": 0.58,
// "count": 1228
// }