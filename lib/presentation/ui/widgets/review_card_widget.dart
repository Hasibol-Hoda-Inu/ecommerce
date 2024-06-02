import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(Icons.person_outline_rounded, color: Colors.white,),
              ),
              SizedBox(width: 14,),
              Text('Hasinul Huda Enu', style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),)
            ],
          ),
          SizedBox(height: 12,),
          Text("Dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),)
        ],
      ),

    );
  }
}