import 'package:flutter/material.dart';

import 'package:flutter_ts5/designs/app_themes.dart';
import 'package:flutter_ts5/screens/home.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.darkTheme,
      home: const Home(),
    );
  }
}
