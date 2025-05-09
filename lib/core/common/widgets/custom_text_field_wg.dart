import 'package:flutter/material.dart';

import '../../responsiveness/app_responsive.dart';
import '../colors/app_colors.dart';

class CustomTextFieldWg extends StatelessWidget {
  final bool isFocused;
  final TextEditingController controller;
  final FocusNode focusNode;
  final IconData prefixIcon;
  final String hintText;
  final VoidCallback? onTap;
  final Widget? trailingWidget;
  final bool obscureText;

  const CustomTextFieldWg(
      {super.key,
        required this.isFocused,
        required this.controller,
        required this.focusNode,
        required this.prefixIcon,
        required this.hintText,
        this.onTap,
        this.trailingWidget,
        this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appH(60),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: appW(20)),
      decoration: BoxDecoration(
        color:
        isFocused ? AppColors.background : AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            width: isFocused ? 2 : 0,
            color:
            isFocused ? AppColors.neonGreen : AppColors.white),
      ),
      child: TextField(
        obscureText: obscureText,
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: AppColors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          suffix: trailingWidget,
          icon: Icon(
            prefixIcon,
            size: appH(20),
            color:
            isFocused ? AppColors.neonGreen : AppColors.grey,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.grey,
            fontSize: 14,
          ),
          border: InputBorder.none,
        ),
        onTap: onTap,
        onSubmitted: (value) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
