import 'package:flutter/material.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/responsiveness/app_responsive.dart';

class CategoryWg extends StatelessWidget {
  final String imagePath;
  final String title;

  const CategoryWg({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: appW(65),
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: appW(10)),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
