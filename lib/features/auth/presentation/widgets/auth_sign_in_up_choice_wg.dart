import 'package:flutter/material.dart';
import '../../../../core/common/colors/app_colors.dart';

class AuthSignInUpChoiceWg extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  const AuthSignInUpChoiceWg({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: TextStyle(color: AppColors.grey, fontSize: 14)),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(color: AppColors.neonGreen, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
