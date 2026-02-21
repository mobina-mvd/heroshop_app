import 'package:flutter/material.dart';
import 'package:heroshop_app/config/constants.dart';
import 'package:heroshop_app/utils/formatters.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String title;
  final int vipPrice;
  final int price;
  final int takhfifPercent;
  final String link;
  final String image;
  final bool vip;
  final bool freeSend;
  final VoidCallback onTap; // این تابع وقتی کارت کلیک شد اجرا میشه

  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.vipPrice,
    required this.price,
    required this.takhfifPercent,
    required this.link,
    required this.image,
    required this.vip,
    required this.freeSend,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // درصد تخفیف
                  if (takhfifPercent != 0)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '${takhfifPercent.toString()}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  // ارسال رایگان
                  if (freeSend)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'ارسال رایگان',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: priceWidget(context, price, vipPrice),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget priceWidget(BuildContext context, int price, int vipPrice) {
    final primaryStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).primaryColor,
    );

    final oldPriceStyle = const TextStyle(
      fontSize: 16,
      color: Colors.grey,
      decoration: TextDecoration.lineThrough,
    );

    // اگر قیمت VIP وجود داشته باشه
    if (vipPrice != 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${formatPrice(vipPrice)} تومان', style: primaryStyle),
          const SizedBox(height: 4, width: double.infinity),
          Text('${formatPrice(price)} تومان', style: oldPriceStyle),
        ],
      );
    }

    // اگر قیمت VIP وجود نداشته باشه
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('${formatPrice(price)} تومان', style: primaryStyle),
        const SizedBox(width: double.infinity),
      ],
    );
  }
}
