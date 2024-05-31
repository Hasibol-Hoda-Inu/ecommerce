import 'package:ecommerce/presentation/ui/widgets/custom_stapper.dart';
import 'package:ecommerce/presentation/ui/widgets/home_screen/product_image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utility/app_color.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  List<Color> colors=[
    Colors.black87,
    Colors.blueAccent,
    Colors.blueGrey,
    Colors.green,
    Colors.orange
  ];

  int _selectedColorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImageSlider(),
                AppBar(
                  leading: BackButton(
                    color: Colors.blueGrey,
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text('Happy new year spacial deal save 30%', style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),),
                      ),
                      CustomStepper(lowerLimit: 1, upperLimit: 100, stepValue: 1, value: 1,
                          onChange: (newValue){
                        print(newValue);
                          })
                    ],
                  ),
                  Row(
                    children: [
                      Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.star,color: Colors.yellow.shade700, size: 22,),
                            const Text('4.8',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                )
                            ),
                          ]
                      ),
                      TextButton(
                        onPressed: (){},
                        child: const Text('Review', style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        color: AppColors.primaryColor,
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(Icons.favorite_outline, size: 18,color: Colors.white,),
                        ),
                      )
                    ],
                  ),
                  Text('Color', style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      itemBuilder: (context, index){
                        return CircleAvatar(
                          backgroundColor: colors[index],
                          child: _selectedColorIndex==index?const Icon(Icons.done, color: Colors.white,):null,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
