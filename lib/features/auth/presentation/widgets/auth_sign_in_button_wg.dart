import 'package:flutter/material.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/responsiveness/app_responsive.dart';

class AuthSignInButtonWg extends StatelessWidget {
  final Widget image;
  final String text;
  final VoidCallback onTap;

  const AuthSignInButtonWg(
      {super.key,
        required this.image,
        required this.text,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: appH(60),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.white),
          borderRadius: BorderRadius.circular(16),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: appW(12),
          children: [
            image,
            Text(
              text,
             style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
