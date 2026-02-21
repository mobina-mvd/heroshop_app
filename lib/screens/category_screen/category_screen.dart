import 'package:flutter/material.dart';
import 'package:heroshop_app/models/product_model.dart';
import 'package:heroshop_app/services/product_api_service.dart';
import 'package:heroshop_app/widgets/product_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final productApiService = ProductApiService();
  final ScrollController _scrollController = ScrollController();

  List<Product> products = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;

  @override
  void initState() {
    fetchProducts();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !isLoading &&
          hasMore) {
        // وقتی نزدیک پایین لیست شدیم، صفحه بعدی را بگیریم
        fetchProducts();
      }
    });
    super.initState();
  }

  Future<void> fetchProducts() async {
    setState(() => isLoading = true);

    final newProducts = await productApiService.getProducts(page: currentPage);

    setState(() {
      currentPage++;
      isLoading = false;
      if (newProducts.isEmpty) {
        hasMore = false;
      } else {
        products.addAll(newProducts);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .55,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      controller: _scrollController,

      itemCount: products.length + (hasMore ? 1 : 0),
      scrollDirection: Axis.vertical,

      padding: const EdgeInsets.all(10),
      itemBuilder: (BuildContext context, int index) {
        if (index < products.length) {
          final Product product = products[index];
          return ProductCard(
            id: product.id,
            title: product.title,
            price: product.price,
            link: product.link,
            image: product.image,
            vipPrice: product.vipPrice!,
            takhfifPercent: product.takhfifPercent!,
            vip: product.vip,
            freeSend: product.freeSend,
            onTap: () {},
          );
        } else {
          // Loader در پایین لیست
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
