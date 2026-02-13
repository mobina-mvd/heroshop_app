class Product {
  final int id;
  final String title;
  final int? vipPrice;
  final int price;
  final int? takhfifPercent;
  final String link;
  final String image;
  final bool vip;
  final bool freeSend;

  Product({
    required this.id,
    required this.title,
    this.vipPrice,
    required this.price,
    this.takhfifPercent,
    required this.link,
    required this.image,
    required this.vip,
    required this.freeSend,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      price: (map['price']).toInt(),
      vipPrice: (map['vip_price'] != null
          ? (map['vip_price'] as num).toInt()
          : 0),
      takhfifPercent: (map['takhfif'] != null
          ? (map['takhfif'] as num).toInt()
          : 0),
      link: map['link'],
      image: map['image'],
      vip: map['vip'] == 1,
      freeSend: map['free_send'] == 1,
    );
  }
}
