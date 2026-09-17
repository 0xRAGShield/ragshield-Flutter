import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_rag/core/constants/app_routes.dart';
import 'package:safe_rag/core/constants/app_styles.dart';
import 'package:safe_rag/core/state/local_provider.dart';
import 'package:safe_rag/core/state/theme_provider.dart';
import 'package:safe_rag/features/ui/intro/widgets/icon_toggle.dart';
import 'package:safe_rag/features/ui/intro/widgets/setting_row.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var localProvider = Provider.of<LocalProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Padding(
            padding: const EdgeInsets.only(top: 96.0, left: 16.0, right: 16.0),
            child: Column(
              children: [
                Image.asset('assets/images/intro_illustration_1.png'),
                const SizedBox(height: 32),
                Text(
                  'onboarding.title1'.tr(),
                  textAlign: TextAlign.center,
                  style: AppStyles.whiteBold24,
                ),
                SizedBox(height: 12),
                Text(
                  'onboarding.desc1'.tr(),
                  textAlign: TextAlign.center,
                  style: AppStyles.lightGreyReg16,
                ),

                SizedBox(height: 28),
                SettingRow(
                  label: 'onboarding.language'.tr(),
                  child: IconToggle(
                    isLeftSelected: context.locale.languageCode == 'en',
                    leftIcon: 'assets/icons/usa_icon.png',
                    rightIcon: 'assets/icons/eg_icon.png',
                    //iconSize: Size(25, 23),
                    onLeft: () => localProvider.changeLanguage(context, 'en'),
                    onRight: () => localProvider.changeLanguage(context, 'ar'),
                  ),
                ),
                SizedBox(height: 16),
                SettingRow(
                  label: 'onboarding.theme'.tr(),
                  child: IconToggle(
                    isLeftSelected: !themeProvider.isDarkMode(),
                    leftIcon: 'assets/icons/light_icon.png',
                    rightIcon: 'assets/icons/dark_icon.png',
                    onLeft: () => themeProvider.changeTheme(ThemeMode.light),
                    onRight: () => themeProvider.changeTheme(ThemeMode.dark),
                  ),
                ),
                SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: FilledButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.introScreen2),
                    style: FilledButton.styleFrom(shape: const StadiumBorder()),
                    child: Text(
                      'onboarding.continue'.tr(),
                      style: AppStyles.whiteBold16,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
