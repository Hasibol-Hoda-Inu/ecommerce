import 'package:ecommerce/presentation/ui/screen/create_review_screen.dart';
import 'package:ecommerce/presentation/ui/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../utility/app_color.dart';
import '../widgets/review_card_widget.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
        leading: BackButton(

        )
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 760,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, item){
                  return const ReviewCardWidget();
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),

            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Reviews (100)', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),),
                // IconButton(
                //     onPressed: (){},
                //     icon: const Icon(Icons.add,)
                // ),
                FloatingActionButton(
                  onPressed: (){
                    Get.to(const CreateReview());
                  },
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(50)
                  ),
                  child: const Icon(Icons.add, color: Colors.white,),
                )
              ],
            ),
          )
        ],
      ),
      );
  }
}

