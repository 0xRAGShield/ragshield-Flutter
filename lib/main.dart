import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safe_rag/core/state/local_provider.dart';
import 'package:safe_rag/core/state/theme_provider.dart';
import 'package:safe_rag/core/theme/app_theme.dart';
import 'package:safe_rag/features/ui/intro/pages/intro_screen_1.dart';
import 'package:safe_rag/features/ui/intro/pages/intro_screen_2.dart';
import 'package:safe_rag/features/ui/intro/pages/intro_screen_3.dart';
import 'package:safe_rag/features/ui/intro/pages/intro_screen_4.dart';

import 'core/constants/app_routes.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.introScreen1,
      routes: {
        AppRoutes.introScreen1: (context) => IntroScreen1(),
        AppRoutes.introScreen2: (context) => IntroScreen2(),
        AppRoutes.introScreen3: (context) => IntroScreen3(),
        AppRoutes.introScreen4: (context) => IntroScreen4(),
      },
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: themeProvider.themeMode,
    );
  }
}
