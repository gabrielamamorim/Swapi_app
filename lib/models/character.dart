class Character {
  final String name;
  final String height;
  final String mass;
  final String hair_color;
  final String birth_year;
  final String gender;

  Character({
    required this.name,
    required this.height,
    required this.mass,
    required this.hair_color,
    required this.birth_year,
    required this.gender
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      height: json['heigth'],
      mass: json['mass'],
      hair_color: json['hair_color'],
      birth_year: json['birth_year'],
      gender: json['gender']
    );
  }
}