// ignore_for_file: public_member_api_docs, sort_constructors_first

class Slider {
  final int id;
  final String title;
  final String image;
  final String link;
  final int? sort;

  Slider({
    required this.id,
    required this.title,
    required this.image,
    required this.link,
    this.sort,
  });

  factory Slider.fromMap(Map<String, dynamic> map) {
    return Slider(
      id: map['id'] as int,
      title: map['title'] as String,
      image: map['image'] as String,
      link: map['link'] as String,
      sort: map['sort'] != null ? map['sort'] as int : 0,
    );
  }
}
