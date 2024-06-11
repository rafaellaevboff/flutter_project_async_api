class Character {
  final String name;
  final String image;
  final String descricao;

  const Character({required this.name, required this.image, required this.descricao});

  factory Character.fromJson(Map<String, dynamic> json){
    return Character(name: json["title"], image: json["image"], descricao: json["description"]);
  }
}