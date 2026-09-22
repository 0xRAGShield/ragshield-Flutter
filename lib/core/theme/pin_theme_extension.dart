import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinThemeExtension extends ThemeExtension<PinThemeExtension> {
  final PinTheme defaultTheme;
  final PinTheme focusedTheme;

  const PinThemeExtension({
    required this.defaultTheme,
    required this.focusedTheme,
  });

  @override
  PinThemeExtension copyWith({
    PinTheme? defaultTheme,
    PinTheme? focusedTheme,
  }) {
    return PinThemeExtension(
      defaultTheme: defaultTheme ?? this.defaultTheme,
      focusedTheme: focusedTheme ?? this.focusedTheme,
    );
  }

  @override
  PinThemeExtension lerp(PinThemeExtension? other, double t) {
    if (other == null) return this;
    return t < 0.5 ? this : other;
  }
}
