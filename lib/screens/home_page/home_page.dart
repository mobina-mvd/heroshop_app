// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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

      body: const Center(child: Icon(Icons.public_sharp, size: 200)),
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
