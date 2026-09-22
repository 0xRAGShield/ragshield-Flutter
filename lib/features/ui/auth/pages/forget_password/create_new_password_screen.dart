import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_rag/core/constants/app_colors.dart';
import 'package:safe_rag/core/routing/app_routes.dart';
import 'package:safe_rag/core/utils/custom_elevated_button.dart';
import 'package:safe_rag/core/utils/validator_helper.dart';
import 'package:safe_rag/features/ui/auth/pages/forget_password/password_update_dialog.dart';
import 'package:safe_rag/features/ui/auth/widgets/custom_text_field.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  final String email;

  const CreateNewPasswordScreen({super.key, required this.email});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateConfirmPassword(String? text) {
    final emptyCheck = ValidatorHelper.validateConfirmPassword(text);
    if (emptyCheck != null) return emptyCheck;

    if (text != passwordController.text) {
      return 'validation.passwordsDoNotMatch'.tr();
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'forgotPassword.newPassword'.tr(),
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
                  SizedBox(height: 24.h),
                  Text(
                    'forgotPassword.newPassword'.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'forgotPassword.newPasswordDesc'.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    label: 'login.passwordLabel'.tr(),
                    hint: '••••••••',
                    prefixIcon: Icons.lock_outline,
                    controller: passwordController,
                    obscureText: _obscurePassword,
                    validator: ValidatorHelper.validatePassword,
                    textInputAction: TextInputAction.next,
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
                  SizedBox(height: 16.h),
                  CustomTextField(
                    label: 'forgotPassword.confirmPasswordLabel'.tr(),
                    hint: '••••••••',
                    prefixIcon: Icons.lock_outline,
                    controller: confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    validator: _validateConfirmPassword,
                    textInputAction: TextInputAction.done,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () => _obscureConfirmPassword =
                              !_obscureConfirmPassword,
                        );
                      },
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.lightGreyColor,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomElevatedButton(
                    text: 'forgotPassword.updatePasswordButton'.tr(),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => PasswordUpdatedDialog(),
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
