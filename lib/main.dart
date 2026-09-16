import 'package:flutter/material.dart';
import 'package:safe_rag/core/theme/app_theme.dart';
import 'package:safe_rag/features/ui/intro/pages/intro_screen_1.dart';
import 'package:safe_rag/features/ui/intro/pages/intro_screen_2.dart';
import 'package:safe_rag/features/ui/intro/pages/intro_screen_3.dart';
import 'package:safe_rag/features/ui/intro/pages/intro_screen_4.dart';

import 'core/constants/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.introScreen1,
      routes: {
        AppRoutes.introScreen1: (context) =>  IntroScreen1(),
        AppRoutes.introScreen2: (context) =>  IntroScreen2(),
        AppRoutes.introScreen3: (context) =>  IntroScreen3(),
        AppRoutes.introScreen4: (context) =>  IntroScreen4(),
      },
    );
  }
}