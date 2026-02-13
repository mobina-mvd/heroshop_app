import 'package:flutter/material.dart';
import 'package:heroshop_app/models/product_model.dart';
import 'package:heroshop_app/services/homepage_api_services.dart';
import 'package:heroshop_app/services/product_api_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [ProductList()]);
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final homePageApiService = HomePageApiServices();
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

    final newProducts = await productApiService.getVipProducts(
      page: currentPage,
    );

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
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,
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
            return Card(
              elevation: 2,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),

                    child: Image.network(product.image, fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 20),
                  Text(product.title),
                  Text(product.price.toString()),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.front_hand_sharp),
                  ),
                ],
              ),
            );
          } else {
            // Loader در پایین لیست
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
