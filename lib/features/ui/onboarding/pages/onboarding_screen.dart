import 'package:flutter/material.dart';
import 'package:safe_rag/core/routing/app_routes.dart';

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

  void _skipToLogin() {
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
        OnboardingScreen2(onContinue: _next, onSkip: _skipToLogin),
        OnboardingScreen3(onContinue: _next, onSkip: _skipToLogin),
        OnboardingScreen4(onContinue: _skipToLogin),
      ],
    );
  }
}
