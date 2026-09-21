import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_rag/core/state/local_provider.dart';
import 'package:safe_rag/core/state/theme_provider.dart';
import 'package:safe_rag/core/theme/app_theme.dart';
import 'package:safe_rag/features/ui/auth/pages/forget_password/forgot_password_screen.dart';
import 'package:safe_rag/features/ui/auth/pages/login/login_screen.dart';
import 'package:safe_rag/features/ui/onboarding/pages/onboarding_screen.dart';

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
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.mainOnboarding,
          routes: {
            AppRoutes.mainOnboarding: (context) => OnboardingScreen(),
            AppRoutes.loginScreen: (context) => LoginScreen(),
            AppRoutes.forgetScreen: (context) => ForgotPasswordScreen(),
          },
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.lightMode,
          darkTheme: AppTheme.darkMode,
          themeMode: themeProvider.themeMode,
        );
      },
    );
  }
}
