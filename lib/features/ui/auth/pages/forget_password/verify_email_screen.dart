import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:safe_rag/core/constants/app_colors.dart';
import 'package:safe_rag/core/utils/custom_elevated_button.dart';
import 'package:safe_rag/features/ui/auth/widgets/build_pin_theme.dart';
import 'package:safe_rag/features/ui/auth/widgets/verify_email_screen_controller.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;

  const VerifyEmailScreen({super.key, required this.email});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen>
    with VerifyEmailScreenController {
  @override
  Widget build(BuildContext context) {
    final pinTheme = BuildPinTheme();
    final defaultPinTheme = pinTheme.buildPinTheme(context);
    final focusedPinTheme = pinTheme.buildPinTheme(context, focused: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'forgotPassword.verificationCode'.tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),

                Center(
                  child: Image.asset('assets/images/forget_password_2.png'),
                ),

                SizedBox(height: 16.h),

                Text(
                  'forgotPassword.verifyEmailAddress'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                SizedBox(height: 8.h),

                Text(
                  'forgotPassword.verificationCodeSentTo'.tr(
                    namedArgs: {'email': widget.email},
                  ),
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 24.h),

                Pinput(
                  length: otpLength,
                  controller: pinController,
                  autofocus: true,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => SizedBox(width: 8.w),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => verifyCode(),
                ),

                SizedBox(height: 32.h),

                CustomElevatedButton(
                  text: 'forgotPassword.confirmCode'.tr(),
                  onPressed: isOtpComplete ? verifyCode : null,
                ),

                SizedBox(height: 24.h),

                ValueListenableBuilder<int>(
                  valueListenable: secondsRemaining,
                  builder: (context, secondsRemainingValue, _) {
                    final canResend = secondsRemainingValue == 0;

                    return Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '00:${secondsRemainingValue.toString().padLeft(2, '0')} ',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            TextSpan(
                              text: 'forgotPassword.resendConfirmationCode'
                                  .tr(),
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(
                                    color: canResend
                                        ? null
                                        : AppColors.lightGreyColor,
                                  ),
                              recognizer: canResend ? resendRecognizer : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
