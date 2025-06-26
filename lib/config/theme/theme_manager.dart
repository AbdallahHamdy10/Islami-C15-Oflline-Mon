import 'package:flutter/material.dart';
import 'package:islami_c15_mon_nahas/core/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorsManager.gold
      ),
      backgroundColor: ColorsManager.black,
      centerTitle: true,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: ColorsManager.gold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: ColorsManager.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.gold,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.black,
    ),
    inputDecorationTheme: InputDecorationTheme(

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ColorsManager.gold, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ColorsManager.gold, width: 1),
      ),

      labelStyle: TextStyle(
        color: ColorsManager.ofWhite,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
