import 'package:flutter/material.dart';
import 'package:musium/core/common/colors/app_colors.dart';

import '../../responsiveness/app_responsive.dart';

class DefaultButtonWg extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const DefaultButtonWg({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appH(58),
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(backgroundColor: AppColors.neonGreen),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
