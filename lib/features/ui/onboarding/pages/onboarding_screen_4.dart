import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_rag/core/utils/custom_elevated_button.dart';

class OnboardingScreen4 extends StatelessWidget {
  const OnboardingScreen4({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 96.h, left: 16.w, right: 16.w),
          child: Column(
            children: [
              Image.asset('assets/images/intro_illustration_4.png'),
              SizedBox(height: 40.h),
              Text(
                'onboarding.title4'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 24.h),
              Text(
                'onboarding.desc4'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 120.h),
              CustomElevatedButton(
                onPressed: onContinue,
                text: 'onboarding.continue'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
