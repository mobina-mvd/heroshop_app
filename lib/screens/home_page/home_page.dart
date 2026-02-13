import 'package:flutter/material.dart';
import 'package:heroshop_app/models/product_model.dart';
import 'package:heroshop_app/services/product_api_service.dart';

class HomePage extends StatelessWidget {
  final apiService = ProductApiService();
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

      body: Column(
        children: [
          FutureBuilder<List<Product>>(
            future: apiService.getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                print(snapshot.hasError);
                return const Center(child: Text('Error'));
              }
              final List<Product> products = snapshot.data!;
              print(products.length);

              return SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (BuildContext context, int index) {
                    final Product product = products[index];

                    return Card.outlined(
                      child: Column(
                        children: [
                          Expanded(child: Image.network(product.image)),
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
                  },
                ),
              );
            },
          ),
        ],
      ),
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
