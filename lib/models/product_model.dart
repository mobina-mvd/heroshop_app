class Product {
  final int id;
  final String title;
  final double? vipPrice;
  final double price;
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price']).toDouble(),
      vipPrice: (json['vip_price'] != null
          ? (json['vip_price'] as num).toDouble()
          : 0),
      takhfifPercent: (json['takhfif'] != null
          ? (json['takhfif'] as num).toInt()
          : 0),
      link: json['link'],
      image: json['image'],
      vip: json['vip'] == 1,
      freeSend: json['free_send'] == 1,
    );
  }
}
