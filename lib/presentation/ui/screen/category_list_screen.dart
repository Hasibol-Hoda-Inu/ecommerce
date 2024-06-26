import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/ui/widgets/category_icon_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop){
        if (didPop){
          return;
        }
        Get.find<MainBottomNavController>().backToHome();
    },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          leading: IconButton(
              onPressed: (){
                Get.find<MainBottomNavController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios_new), color: Colors.blueGrey,)
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 16,
              ), itemBuilder: (context, index){
                return const FittedBox(child: CategoryCard()) ;
          }
          ),
        ),
      ),
    );
  }
}
