import 'package:flutter/material.dart';

import '../utility/app_color.dart';
import '../utility/image_assets.dart';
import 'custom_stapper.dart';

class ProductListForCartScreen extends StatelessWidget {
  const ProductListForCartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageAssets.ShoePicture2),
                    fit: BoxFit.fill
                ),
              ),
            ),
            const SizedBox(width: 12,),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('New year special shoe', style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87
                            ),),
                            const SizedBox(height: 4,),
                            RichText(text: const TextSpan(
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                                children: [
                                  TextSpan(text: 'Color: Blue, '),
                                  TextSpan(text: 'Size: XL')
                                ]
                            ))
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.delete_outline))
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('\$1,000', style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),
                      SizedBox(
                        width: 90,
                        child: FittedBox(
                          child: CustomStepper(lowerLimit: 1, upperLimit: 100, stepValue: 1, value: 1,
                              onChange: (newValue){
                                print(newValue);
                              }),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}