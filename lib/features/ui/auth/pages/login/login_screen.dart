import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:safe_rag/core/constants/app_colors.dart';
import 'package:safe_rag/core/routing/app_routes.dart';
import 'package:safe_rag/core/state/local_provider.dart';
import 'package:safe_rag/core/utils/custom_elevated_button.dart';
import 'package:safe_rag/core/utils/custom_text_button.dart';
import 'package:safe_rag/core/utils/validator_helper.dart';
import 'package:safe_rag/features/ui/auth/widgets/custom_text_field.dart';
import 'package:safe_rag/features/ui/onboarding/widgets/icon_toggle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool _keepSignedIn = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localProvider = Provider.of<LocalProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: 16.h),
                  Text(
                    'login.title'.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'login.desc'.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    label: 'login.emailLabel'.tr(),
                    hint: 'login.emailHint'.tr(),
                    prefixIcon: Icons.mail_outline,
                    validator: ValidatorHelper.validateEmail,
                    controller: emailController,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    label: 'login.passwordLabel'.tr(),
                    hint: '••••••••',
                    prefixIcon: Icons.lock_outline,
                    obscureText: _obscurePassword,
                    controller: passwordController,
                    validator: ValidatorHelper.validatePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.lightGreyColor,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomElevatedButton(
                    text: 'login.signInButton'.tr(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, AppRoutes.homeScreen);
                      }
                    },
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: Checkbox(
                          value: _keepSignedIn,
                          onChanged: (value) {
                            setState(() => _keepSignedIn = value ?? false);
                          },
                          activeColor: AppColors.blueColor,
                          checkColor: AppColors.whiteColor,
                          side: const BorderSide(
                            color: AppColors.lightGreyColor,
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'login.keepMeSignedIn'.tr(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const Spacer(),
                      CustomTextButton(
                        text: 'login.forgotPassword'.tr(),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.forgetScreen);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  buildFooter(context),
                  SizedBox(height: 40.h),
                  Center(
                    child: IconToggle(
                      isLeftSelected: context.locale.languageCode == 'en',
                      leftIcon: 'assets/icons/usa_icon.png',
                      rightIcon: 'assets/icons/eg_icon.png',
                      onLeft: () => localProvider.changeLanguage(context, 'en'),
                      onRight: () =>
                          localProvider.changeLanguage(context, 'ar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'login.Trouble signing in?'.tr(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextSpan(
              text: 'login.Contact IT service desk'.tr(),
              style: Theme.of(context).textTheme.headlineSmall,
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
