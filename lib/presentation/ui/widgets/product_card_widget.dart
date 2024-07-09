import 'package:ecommerce/presentation/ui/screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product.dart';
import '../utility/app_color.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(const ProductDetailsScreen());
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                    image: DecorationImage(
                        image: NetworkImage(product.image??'')
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     Text(product.title?? '',
                      style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),),
                    const SizedBox(height: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("\${product.price?? 0}",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),),
                        Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.star,color: Colors.yellow.shade700, size: 20,),
                               Text("${product.star ?? 0}",
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                  )
                              ),
                            ]
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          color: AppColors.primaryColor,
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.favorite_outline, size: 14,color: Colors.white,),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}