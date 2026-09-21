import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_rag/core/widgets/custom_elevated_button.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key, required this.onContinue, this.onSkip});

  final VoidCallback onContinue;
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: onSkip == null
                    ? SizedBox(height: 40.h)
                    : GestureDetector(
                        onTap: onSkip,
                        child: Text(
                          'onboarding.skip'.tr(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
              ),
              SizedBox(height: 56.h),
              Image.asset('assets/images/intro_illustration_2.png'),
              SizedBox(height: 56.h),
              Text(
                'onboarding.title2'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 24.h),
              Text(
                'onboarding.desc2'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 88.h),
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
