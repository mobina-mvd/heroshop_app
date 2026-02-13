class MainCategory {
  final int id;
  final String name;
  final String enName;
  final String image;

  MainCategory({
    required this.id,
    required this.name,
    required this.enName,
    required this.image,
  });

  factory MainCategory.fromMap(Map<String, dynamic> map) {
    return MainCategory(
      id: map['id'] as int,
      name: map['name'] as String,
      enName: map['en_name'] as String,
      image: map['image'] as String,
    );
  }
}
