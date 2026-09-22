import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  final String email;

  const CreateNewPasswordScreen({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SizedBox.shrink(),
    );
  }
}
