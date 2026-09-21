import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:safe_rag/core/constants/app_colors.dart';
import 'package:safe_rag/core/state/theme_provider.dart';

class IconToggle extends StatelessWidget {
  const IconToggle({
    super.key,
    required this.isLeftSelected,
    required this.leftIcon,
    required this.rightIcon,
    required this.onLeft,
    required this.onRight,
  });

  final bool isLeftSelected;
  final String leftIcon;
  final String rightIcon;
  final VoidCallback onLeft;
  final VoidCallback onRight;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.isDarkMode()
            ? AppColors.secondryColor
            : AppColors.labelColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Thumb(
            selected: isLeftSelected,
            icon: leftIcon,
            //size: iconSize,
            onTap: onLeft,
          ),
          _Thumb(
            selected: !isLeftSelected,
            icon: rightIcon,
            //size: iconSize,
            onTap: onRight,
          ),
        ],
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  const _Thumb({
    required this.selected,
    required this.icon,
    required this.onTap,
  });

  final bool selected;
  final String icon;
  //final Size size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 32.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? AppColors.blueColor : null,
        ),
        child: Image.asset(icon),
      ),
    );
  }
}
