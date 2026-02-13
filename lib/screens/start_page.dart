import 'package:flutter/material.dart';
import 'package:heroshop_app/screens/cart_screen/cart_screen.dart';
import 'package:heroshop_app/screens/category_screen/category_screen.dart';
import 'package:heroshop_app/screens/home_screen/home_screen.dart';
import 'package:heroshop_app/screens/profile_screen/profile_screen.dart';
import 'package:heroshop_app/screens/search_screen/search_screen.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final List _pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: const MyAppBar(title: 'هیروشاپ'),

      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index != _currentPage) {
            setState(() {
              _currentPage = index;
            });
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
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
