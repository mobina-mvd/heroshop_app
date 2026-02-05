import 'package:flutter/material.dart';
import 'package:heroshop_app/config/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: AppColors.primaryLight,
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SafeArea(
              child: Text(
                "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: "IranSans",
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
