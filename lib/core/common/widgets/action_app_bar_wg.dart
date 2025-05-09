import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../responsiveness/app_responsive.dart';
import '../colors/app_colors.dart';

class ActionAppBarWg extends StatelessWidget implements PreferredSizeWidget {
  const ActionAppBarWg({
    super.key,
    this.titleText,
    required this.onBackPressed,
    this.actions,
  });

  final String? titleText;
  final VoidCallback onBackPressed;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      title: Text(
        titleText ?? "",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
      leading: IconButton(
        onPressed: onBackPressed,
        icon: Icon(
          IconlyLight.arrow_left,
          size: appH(28),
          color: AppColors.white,
        ),
      ),
      actions: actions,
    );
  }
}
