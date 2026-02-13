import 'package:flutter/material.dart';
import 'package:heroshop_app/models/product_model.dart';
import 'package:heroshop_app/services/product_api_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: const MyAppBar(
        title: 'هیروشاپ',
        // titleColor: Theme.of(context).brightness == Brightness.dark
        //     ? AppColors.onPrimaryDark
        //     : AppColors.onPrimaryLight,
      ),

      body: const Column(children: [ProductList()]),
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        // backgroundColor: AppColors.backgroundLight,
        indicatorColor: Colors.red,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'خانه'),
          NavigationDestination(icon: Icon(Icons.menu), label: 'منو'),
          NavigationDestination(
            icon: Icon(Icons.shopping_basket_outlined),
            label: 'سبد خرید',
          ),
          NavigationDestination(icon: Icon(Icons.search), label: 'جستجو'),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'داشبورد',
          ),
        ],
      ),

      // BottomNavigationBar(
      //   currentIndex: 0,
      //   backgroundColor: Colors.red,

      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //   ],
      // ),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final apiService = ProductApiService();
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

    final newProducts = await apiService.getProducts(page: currentPage);

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

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(fontSize: 25)),
      toolbarOpacity: 1,
      elevation: 0,
      // foregroundColor: AppColors.borderDark,
      // backgroundColor: AppColors.backgroundLight,
      toolbarHeight: 56,
      // bottom: const TabBar(tabs: [Text('Tab1'), Text('Tab2')]),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_basket_outlined, size: 28),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.person, size: 28)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: 28)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
