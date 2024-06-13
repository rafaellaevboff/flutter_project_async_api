import 'package:flutter_project_async_api/services/busca_api.dart';

class HarryPotter implements FromJsonConvertible<HarryPotter> {
  final String name;
  final String image;
  final String description;

  const HarryPotter({required this.name, required this.image, required this.description});

  factory HarryPotter.fromJson(Map<String, dynamic> json){
    return HarryPotter(name: json["title"], image: json["cover"], description: json["description"]);
  }

  @override
  HarryPotter fromJson(Map<String, dynamic> json) {
    return HarryPotter(name: json["title"], image: json["cover"], description: json["description"]);
  }
}