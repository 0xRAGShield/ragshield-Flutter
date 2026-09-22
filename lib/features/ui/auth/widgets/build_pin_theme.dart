import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:safe_rag/core/theme/pin_theme_extension.dart';

class BuildPinTheme {
  PinTheme buildPinTheme(BuildContext context, {bool focused = false}) {
    final pinThemeExtension =
        Theme.of(context).extension<PinThemeExtension>()!;

    return focused
        ? pinThemeExtension.focusedTheme
        : pinThemeExtension.defaultTheme;
  }
}