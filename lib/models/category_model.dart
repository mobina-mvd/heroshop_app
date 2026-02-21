class Category {
  final int id;
  final String name;
  final String enName;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.enName,
    required this.image,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      enName: map['en_name'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
