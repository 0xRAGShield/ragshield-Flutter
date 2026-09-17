import 'package:flutter/material.dart';
import 'package:safe_rag/core/constants/app_styles.dart';

class SettingRow extends StatelessWidget {
  const SettingRow({super.key, required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: AppStyles.lightGreyReg16),
        const Spacer(),
        child,
      ],
    );
  }
}
