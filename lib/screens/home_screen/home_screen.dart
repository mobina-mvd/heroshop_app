import 'package:flutter/material.dart';
import 'package:heroshop_app/config/constants.dart';
import 'package:heroshop_app/models/home_response_model.dart';
import 'package:heroshop_app/models/product_model.dart';
import 'package:heroshop_app/services/homepage_api_services.dart';
import 'package:heroshop_app/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageApiServices homePageApiServices = HomePageApiServices();

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<HomeResponse>(
          future: homePageApiServices.getHomePageData(),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else if (asyncSnapshot.hasError) {
              return const Center(child: Text('Error loading data'));
            } else if (!asyncSnapshot.hasData) {
              return const Center(child: Text('No data'));
            } else {
              final data = asyncSnapshot.data!;

              return ListView(
                children: [
                  const SizedBox(
                    height: 200,
                    child: Center(child: Text('Slider Page View')),
                  ),

                  VipProductsSection(products: data.vipProducts),

                  const SizedBox(
                    height: 255,
                    child: Center(child: Text('New Products Carusel')),
                  ),
                  const SizedBox(
                    height: 255,
                    child: Center(child: Text('Top Seller Products Carusel')),
                  ),
                  const SizedBox(
                    height: 255,
                    child: Center(child: Text('Brands List Carusel')),
                  ),

                  ...List<Widget>.generate(10, (index) {
                    return SizedBox(
                      height: 255,
                      child: Center(
                        child: Text(
                          'MainCategory Products Carusels ${index + 1}',
                        ),
                      ),
                    );
                  }),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class VipProductsSection extends StatelessWidget {
  final List<Product> products;
  const VipProductsSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final cardHeight = SizeConfig.blockSizeVertical * 40;
    final cardWidth = SizeConfig.blockSizeHorizontal * 50;

    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 16),
      height: cardHeight,
      child: ListView.separated(
        itemCount: products.length + 1,
        padding: const EdgeInsets.only(left: 12),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 12);
        },
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 4,
                right: SizeConfig.blockSizeHorizontal * 3,
              ),
              child: SizedBox(
                width: cardWidth,
                height: cardHeight,
                child: const Center(child: Text('hello')), // کارت ثابت
              ),
            );
          }

          // بقیه محصولات (با شیفت اندیس)
          final product = products[index - 1];

          return SizedBox(
            width: cardWidth,
            height: cardHeight,
            child: ProductCard(
              id: product.id,
              title: product.title,
              vipPrice: product.vipPrice!,
              price: product.price,
              takhfifPercent: product.takhfifPercent!,
              link: product.link,
              image: product.image,
              vip: product.vip,
              freeSend: product.freeSend,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
