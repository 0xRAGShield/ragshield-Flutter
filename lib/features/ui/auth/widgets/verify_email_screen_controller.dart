import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:safe_rag/core/utils/custom_toast.dart';
import 'package:safe_rag/features/ui/auth/pages/forget_password/create_new_password_screen.dart';
import 'package:safe_rag/features/ui/auth/pages/forget_password/verify_email_screen.dart';

mixin VerifyEmailScreenController on State<VerifyEmailScreen> {
  final int otpLength = 4;
  final int timerDuration = 20;

  final TextEditingController pinController = TextEditingController();
  late final ValueNotifier<int> secondsRemaining = ValueNotifier<int>(
    timerDuration,
  );

  Timer? timer;
  late final TapGestureRecognizer resendRecognizer;

  bool isOtpComplete = false;

  @override
  void initState() {
    super.initState();
    resendRecognizer = TapGestureRecognizer()..onTap = resendCode;
    pinController.addListener(onPinChanged);
    startTimer();
  }

  void onPinChanged() {
    final complete = pinController.text.length == otpLength;
    if (complete != isOtpComplete) {
      setState(() => isOtpComplete = complete);
    }
  }

  void startTimer() {
    timer?.cancel();
    secondsRemaining.value = timerDuration;

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        t.cancel();
      }
    });
  }

  void verifyCode() {
    if (!isOtpComplete) {
      showToast('forgotPassword.otpIncomplete'.tr());
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CreateNewPasswordScreen(email: widget.email),
      ),
    );
  }

  void resendCode() {
    if (secondsRemaining.value != 0) return;

    startTimer();
    showToast('forgotPassword.codeResent'.tr());
  }

  void showToast(String message) {
    AppToast.show(message);
  }

  @override
  void dispose() {
    timer?.cancel();
    secondsRemaining.dispose();
    pinController.removeListener(onPinChanged);
    pinController.dispose();
    resendRecognizer.dispose();
    super.dispose();
  }
}
