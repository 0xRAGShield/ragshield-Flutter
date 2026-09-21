import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalProvider extends ChangeNotifier {
  Future<void> changeLanguage(BuildContext context, String newLanguage) async {
    if (context.locale.languageCode == newLanguage) return;
    await context.setLocale(Locale(newLanguage));
    notifyListeners();
  }
}
