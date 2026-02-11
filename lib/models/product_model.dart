class Product {
  final int id;
  final String title;
  final double vipPrice;
  final double price;
  final int takhfifPercent;
  final String? description;
  final String shortText;
  final double date;
  final bool active;
  final String link;
  final int sellType;
  final String? sku;
  final String pageTitle;
  final String image;
  final int brandId;
  final int simPr;
  final int sugPr;
  final int countSell;
  final int countView;
  final double buyPrice;
  final bool disable;
  final double timeActive;
  final bool vip;
  final bool freeSend;
  final List<String>? imagesData;

  Product({
    required this.id,
    required this.title,
    required this.vipPrice,
    required this.price,
    required this.takhfifPercent,
    this.description,
    required this.shortText,
    required this.date,
    required this.active,
    required this.link,
    required this.sellType,
    this.sku,
    required this.pageTitle,
    required this.image,
    required this.brandId,
    required this.simPr,
    required this.sugPr,
    required this.countSell,
    required this.countView,
    required this.buyPrice,
    required this.disable,
    required this.timeActive,
    required this.vip,
    required this.freeSend,
    this.imagesData,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      vipPrice: (json['vip_price'] as num).toDouble(),
      takhfifPercent: (json['takhfif'] as num).toInt(),
      description: json['description'] ?? '',
      shortText: json['short_text'],
      date: (json['date'] as num).toDouble(),
      active: json['active'] == 1,
      link: json['link'],
      sellType: (json['sell_type'] as num).toInt(),
      sku: json['sku'] ?? '',
      pageTitle: json['page_title'],
      image: json['image'],
      brandId: json['brand_id'],
      simPr: json['sim_pr'],
      sugPr: json['sug_pr'],
      countSell: json['count_sell'],
      countView: json['count_view'],
      buyPrice: (json['price'] as num).toDouble(),
      disable: json['disable'] == 1,
      timeActive: (json['time_active'] as num).toDouble(),
      vip: json['vip'] == 1,
      freeSend: json['free_send'] == 1,
      imagesData: List<String>.from(json['data']['images'] ?? []),
    );
  }
}
