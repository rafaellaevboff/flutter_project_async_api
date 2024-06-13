import 'package:flutter_project_async_api/services/busca_api.dart';

class CharactersHP implements FromJsonConvertible<CharactersHP> {
  final String name;
  final String image;
  final String description;

  const CharactersHP({required this.name, required this.image, required this.description});

  factory CharactersHP.fromJson(Map<String, dynamic> json){
    return CharactersHP(name: json["fullName"], image: json["image"], description: json["hogwartsHouse"]);
  }

  @override
  CharactersHP fromJson(Map<String, dynamic> json) {
    return CharactersHP(name: json["fullName"], image: json["image"], description: json["hogwartsHouse"]);
  }
}