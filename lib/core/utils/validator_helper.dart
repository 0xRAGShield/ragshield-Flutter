import 'package:easy_localization/easy_localization.dart';

class ValidatorHelper {
  static String? validateEmail(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'validation.emailRequired'.tr();
    }
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(text);
    if (!emailValid) {
      return 'validation.emailInvalid'.tr();
    }
    return null;
  }

  static String? validatePassword(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'validation.passwordRequired'.tr();
    }

    if (text.length <= 8) {
      return 'validation.passwordInvalid'.tr();
    }

    return null;
  }

  static String? validateConfirmPassword(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'validation.confirmPasswordRequired'.tr();
    }
    return null;
  }
}
