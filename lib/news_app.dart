import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home/home_screen.dart';
import 'package:news_app/presentation/theme/theme_color.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsBuzz',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: ThemeColor.lightBackgroundColor,
        colorScheme: ThemeColor.lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ThemeColor.darkBackgroundColor,
        colorScheme: ThemeColor.darkColorScheme,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
