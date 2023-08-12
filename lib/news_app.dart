import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/screens/home/home_screen.dart';
import 'package:news_app/presentation/theme/theme_color.dart';
import 'package:news_app/presentation/theme/theme_text.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'NewsBuzz',
            theme: ThemeData(
              textTheme: ThemeText.getTextTheme(),
              colorScheme: ThemeColor.lightColorScheme,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              textTheme: ThemeText.getTextTheme(),
              scaffoldBackgroundColor: ThemeColor.darkBackgroundColor,
              colorScheme: ThemeColor.darkColorScheme,
              useMaterial3: true,
            ),
            themeMode: ThemeMode.system,
            home: HomeScreen(),
          );
        });
  }
}
