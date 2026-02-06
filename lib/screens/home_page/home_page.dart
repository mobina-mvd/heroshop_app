import 'package:flutter/material.dart';
import 'package:heroshop_app/config/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Drawer(),
      appBar: MyAppBar(title: 'هیروشاپ', titleColor: AppColors.primaryLight),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      body: Text('Hello HeroShop App , Welcome'),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color titleColor;
  const MyAppBar({super.key, required this.title, required this.titleColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: titleColor, fontSize: 25)),
      toolbarOpacity: 1,
      elevation: 0,
      foregroundColor: AppColors.borderDark,
      backgroundColor: AppColors.backgroundLight,
      toolbarHeight: 80,
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
  Size get preferredSize => const Size.fromHeight(80);
}
