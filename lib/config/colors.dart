import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // جلوگیری از ساخت نمونه

  // ================== Primary Colors ==================
  static const Color primaryLight = Color(
    0xFFE80566,
  ); // رنگ اصلی برند در لایت - دکمه‌ها، CTA
  static const Color onPrimaryLight =
      Colors.white; // متن یا آیکن روی primaryLight
  static const Color primaryVariantLight = Color(
    0xFFCC045A,
  ); // حالت pressed / hover

  static const Color primaryDark = Color(
    0xFFFF5C99,
  ); // رنگ اصلی برند در دارک - دکمه‌ها، CTA
  static const Color onPrimaryDark = Colors.black; // متن روی primaryDark
  static const Color primaryVariantDark = Color(
    0xFFCC045A,
  ); // حالت pressed / hover

  // ================== Secondary Colors ==================
  static const Color secondaryLight = Color(
    0xFF3ABAF4,
  ); // رنگ ثانویه لایت - لینک‌ها، highlight
  static const Color onSecondaryLight = Colors.white; // متن روی secondaryLight
  static const Color secondaryVariantLight = Color(
    0xFF2D98DA,
  ); // حالت hover/pressed

  static const Color secondaryDark = Color(0xFF7ED0FF); // رنگ ثانویه دارک
  static const Color onSecondaryDark = Colors.black;
  static const Color secondaryVariantDark = Color(0xFF2D98DA);

  // ================== Background ==================
  static const Color backgroundLight = Color(0xFFFFFFFF); // پس‌زمینه اصلی لایت
  static const Color onBackgroundLight = Color(
    0xFF000000,
  ); // متن روی background

  static const Color backgroundDark = Color(0xFF121212); // پس‌زمینه اصلی دارک
  static const Color onBackgroundDark = Colors.white; // متن روی background

  // ================== Neutral / UI Elements ==================
  static const Color borderLight = Color(0xFFCCCCCC); // خط دور input، container
  static const Color dividerLight = Color(0xFFE0E0E0); // divider line
  static const Color borderFocusedLight = Color(0xFF3ABAF4); // هنگام focus
  static const Color borderErrorLight = Color(0xFFE53935); // هنگام error

  static const Color borderDark = Color(0xFF444444);
  static const Color dividerDark = Color(0xFF555555);
  static const Color borderFocusedDark = Color(0xFF7ED0FF);
  static const Color borderErrorDark = Color(0xFFEF5350);

  static const Color textPrimaryLight = Color(0xFF000000); // متن اصلی لایت
  static const Color textSecondaryLight = Color(0xFF4A4A4A); // متن ثانویه
  static const Color textDisabledLight = Color(
    0xFF9E9E9E,
  ); // متن غیر فعال / placeholder
  static const Color textHintLight = Color(0xFFBDBDBD); // hint text

  static const Color textPrimaryDark = Colors.white;
  static const Color textSecondaryDark = Color(0xFFB3B3B3);
  static const Color textDisabledDark = Color(0xFF757575);
  static const Color textHintDark = Color(0xFF9E9E9E);

  // ================== State Colors ==================
  static const Color successLight = Color(0xFF4CAF50); // موفقیت / تایید
  static const Color onSuccessLight = Colors.white;

  static const Color successDark = Color(0xFF81C784);
  static const Color onSuccessDark = Colors.black;

  static const Color errorLight = Color(0xFFE53935); // خطا / هشدار
  static const Color onErrorLight = Colors.white;

  static const Color errorDark = Color(0xFFEF5350);
  static const Color onErrorDark = Colors.black;

  static const Color warningLight = Color(0xFFFFA000); // هشدار / attention
  static const Color onWarningLight = Colors.black;

  static const Color warningDark = Color(0xFFFFB74D);
  static const Color onWarningDark = Colors.black;
}
