import 'package:ecommerce/presentation/ui/screen/home_screen.dart';
import 'package:ecommerce/presentation/ui/screen/reviews.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_stapper.dart';
import 'package:ecommerce/presentation/ui/widgets/home_screen/product_image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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

  List <String> sizes = [
    'S',
    'L',
    'M',
    'XL',
    '2XL',
    '3XL',
  ];

  int _selectedColorIndex = 0;
  int _selectedSizeIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                const ProductImageSlider(),
                AppBar(
                  title: const Text('Product details'),
                  leading: BackButton(
                    color: Colors.blueGrey,
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
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
                            onPressed: (){
                              Get.to(const Reviews());
                            },
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
                      const Text('Color', style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),),
                      SizedBox(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: colors.length,
                          itemBuilder: (context, index){
                            return InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: (){
                                _selectedColorIndex =index;
                                if(mounted){
                                  setState(() {

                                  });
                                }
                              },
                              child: CircleAvatar(
                                backgroundColor: colors[index],
                                child: _selectedColorIndex==index?const Icon(Icons.done, color: Colors.white,):null,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16,),
                      const Text('Size', style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87
                      ),),
                      const SizedBox(height: 4,),
                      SizedBox(
                        height: 42,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sizes.length,
                          itemBuilder: (context, index){
                            return InkWell(
                              borderRadius: BorderRadius.circular(40),
                              onTap: (){
                                _selectedSizeIndex =index;
                                if(mounted){
                                  setState(() {

                                  });
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(color:_selectedSizeIndex==index?AppColors.primaryColor:Colors.black87),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: _selectedSizeIndex==index?AppColors.primaryColor:Colors.white,
                                  child: Text(sizes[index], style: TextStyle(
                                    color: _selectedSizeIndex==index?Colors.white:null,
                                    fontSize: 14,
                                  ),),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16,),
                      const Text('Description', style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87
                      ),),
                      const SizedBox(height: 4,),
                      const Text("Dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took unknown printer took Dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took unknown printer took Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took unknown printer took Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took unknown printer took Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took unknown printer took Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took unknown printer took Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took unknown printer took", style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54
                      ),),
                    ],
                  ),
                ),
              )
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price', style: TextStyle(
                          fontSize: 16,
                        ),),
                        SizedBox(height: 4,),
                        Text("\$1,000", style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),)
                      ],
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                          onPressed: (){},
                          child: const Text('Add to cart')),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
