class Coffee {
  final String name;
  final String image;
  final String description;

  const Coffee({required this.name, required this.image, required this.description});

  factory Coffee.fromJson(Map<String, dynamic> json){
    return Coffee(name: json["title"], image: json["image"], description: json["description"]);
  }
}