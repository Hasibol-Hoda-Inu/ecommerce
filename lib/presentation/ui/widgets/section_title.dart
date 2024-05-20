import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class SectionTitle extends StatefulWidget {
  const SectionTitle({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  State<SectionTitle> createState() => _SectionTitleState();
}

class _SectionTitleState extends State<SectionTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        TextButton(
            onPressed: (widget.onTap),
            child: const Text(
              'See all',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
            ))
      ],
    );
  }
}
