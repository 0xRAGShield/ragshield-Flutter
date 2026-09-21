import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:safe_rag/core/state/local_provider.dart';
import 'package:safe_rag/core/state/theme_provider.dart';
import 'package:safe_rag/core/widgets/custom_elevated_button.dart';
import 'package:safe_rag/features/ui/onboarding/widgets/icon_toggle.dart';
import 'package:safe_rag/features/ui/onboarding/widgets/setting_row.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var localProvider = Provider.of<LocalProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 96.h, left: 16.w, right: 16.w),
          child: Column(
            children: [
              Image.asset('assets/images/intro_illustration_1.png'),
              SizedBox(height: 40.h),
              Text(
                'onboarding.title1'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 24.h),
              Text(
                'onboarding.desc1'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              SizedBox(height: 40.h),
              SettingRow(
                label: 'onboarding.language'.tr(),
                child: IconToggle(
                  isLeftSelected: context.locale.languageCode == 'en',
                  leftIcon: 'assets/icons/usa_icon.png',
                  rightIcon: 'assets/icons/eg_icon.png',
                  onLeft: () => localProvider.changeLanguage(context, 'en'),
                  onRight: () => localProvider.changeLanguage(context, 'ar'),
                ),
              ),
              SizedBox(height: 16.h),
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
              Spacer(),
              CustomElevatedButton(
                text: 'Continue'.tr(),
                onPressed: onContinue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
