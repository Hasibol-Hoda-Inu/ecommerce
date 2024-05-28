import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
          const EdgeInsets.symmetric(horizontal: 8.0),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryColor.withOpacity(0.1),
          ),
          child: const Icon(
            Icons.tv,
            size: 50,
            color: AppColors.primaryColor,
          ),
        ),
        const Text(
          'Electronics',
          style: TextStyle(
            fontSize: 15,
            color: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}