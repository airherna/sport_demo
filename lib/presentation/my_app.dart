import 'package:flutter/material.dart';
import 'package:sport/presentation/common/theme/color_theme.dart';
import 'package:sport/presentation/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sport App',
      theme: ColorTheme.getColorTheme(context),
      home: const HomePage(title: 'Sports App Demo'),
    );
  }
}
