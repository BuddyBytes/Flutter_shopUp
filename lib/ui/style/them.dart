import 'package:flutter/material.dart';
import 'package:shopup/ui/style/colors.dart';

final lighTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: defualtColor,
    unselectedItemColor: Colors.grey[400],
    elevation: 40,
  ),
);
