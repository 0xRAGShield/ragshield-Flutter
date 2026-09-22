import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_rag/core/utils/custom_elevated_button.dart';
import 'package:safe_rag/core/utils/validator_helper.dart';
import 'package:safe_rag/features/ui/auth/pages/forget_password/verify_email_screen.dart';
import 'package:safe_rag/features/ui/auth/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'forgotPassword.appBarTitle'.tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  Center(
                    child: Image.asset('assets/images/forget_password_2.png'),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'forgotPassword.title'.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'forgotPassword.desc'.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    label: 'forgotPassword.emailLabel'.tr(),
                    hint: 'forgotPassword.emailHint'.tr(),
                    prefixIcon: Icons.mail_outline,
                    controller: emailController,
                    validator: ValidatorHelper.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 32.h),
                  CustomElevatedButton(
                    text: 'forgotPassword.confirmMailButton'.tr(),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VerifyEmailScreen(email: emailController.text),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
