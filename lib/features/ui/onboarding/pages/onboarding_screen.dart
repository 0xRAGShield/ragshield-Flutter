import 'package:flutter/material.dart';
import 'package:safe_rag/core/routing/app_routes.dart';
import 'package:safe_rag/core/utils/onboarding_helper.dart';

import 'onboarding_screen_1.dart';
import 'onboarding_screen_2.dart';
import 'onboarding_screen_3.dart';
import 'onboarding_screen_4.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();

  void _next() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> finishOnboarding() async {
    await OnboardingHelper.setOnboardingSeen();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        OnboardingScreen1(onContinue: _next),
        OnboardingScreen2(onContinue: _next, onSkip: finishOnboarding),
        OnboardingScreen3(onContinue: _next, onSkip: finishOnboarding),
        OnboardingScreen4(onContinue: finishOnboarding),
      ],
    );
  }
}
