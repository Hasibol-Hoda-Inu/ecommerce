import 'package:ecommerce/data/models/category_data.dart';
import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class CategoryCard extends StatelessWidget {
  final CategoryData categoryData;

  const CategoryCard({
    super.key, required this.categoryData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          height: 80,
          width: 80,
          child: Image.network(categoryData.categoryImg ?? ""),
        ),
        Text(
          categoryData.categoryName ?? '',
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}