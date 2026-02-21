class HomeSlider {
  final int id;
  final String title;
  final String image;
  final String link;
  final int sort;

  HomeSlider({
    required this.id,
    required this.title,
    required this.image,
    required this.link,
    required this.sort,
  });

  factory HomeSlider.fromMap(Map<String, dynamic> map) {
    return HomeSlider(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      link: map['link'] ?? '',
      sort: map['sort'] ?? 0,
    );
  }
}
