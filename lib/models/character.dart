class Character {
  final String name;
  final String height;
  final String mass;
  final String gender;

  Character({
    required this.name,
    required this.height,
    required this.mass,
    required this.gender
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ?? 'N/A',
      height: json['heigth'] ?? 'N/A',
      mass: json['mass'] ?? 'N/A',
      gender: json['gender'] ?? 'N/A'
    );
  }
}