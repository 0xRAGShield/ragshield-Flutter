import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:safe_rag/core/routing/app_routes.dart';
import 'package:safe_rag/core/utils/custom_elevated_button.dart';

class PasswordUpdatedDialog extends StatelessWidget {
  const PasswordUpdatedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200.h,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: Lottie.asset(
                        'assets/animations/confetti.json',
                        fit: BoxFit.cover,
                        repeat: false,
                      ),
                    ),
                    SizedBox(
                      width: 110.w,
                      height: 110.w,
                      child: Lottie.asset(
                        'assets/animations/success_check.json',
                        fit: BoxFit.contain,
                        repeat: false,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'forgotPassword.updatedSuccessfully'.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 8.h),
              Text(
                'forgotPassword.passwordCreated'.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 24.h),
              CustomElevatedButton(
                text: 'login.signInButton'.tr(),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, AppRoutes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
