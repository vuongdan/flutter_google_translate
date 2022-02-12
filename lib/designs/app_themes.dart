import 'package:flutter/material.dart';

class MyThemeData {
  static final darkTheme = ThemeData(
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      bottomAppBarColor: Colors.black,
      primaryColor: const Color(0xff404661),
      cardColor: const Color(0xff202842),
      shadowColor: const Color(0xFF6E4FAF),
      canvasColor: Colors.black,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle:
            TextStyle(color: Colors.white, fontFamily: "cute", fontSize: 28),
      ),
      textTheme: const TextTheme(
          titleLarge:
              TextStyle(color: Colors.white, fontFamily: "cute", fontSize: 32),
          titleMedium:
              TextStyle(color: Colors.white, fontFamily: "cute", fontSize: 28),
          titleSmall:
              TextStyle(color: Colors.white, fontFamily: "cute", fontSize: 24),
          bodyLarge:
              TextStyle(color: Colors.blue, fontFamily: "cute", fontSize: 24),
          bodyMedium:
              TextStyle(color: Colors.white, fontFamily: "cute", fontSize: 20),
          bodySmall: TextStyle(
              color: Colors.white, fontFamily: "cute", fontSize: 16)));
}
