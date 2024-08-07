import 'package:ecommerce/presentation/state_holders/category_controller.dart';
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
        body: RefreshIndicator(
          onRefresh: ()async{
            Get.find<CategoryController>().getCategories();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GetBuilder<CategoryController>(
              builder: (categoryController) {
                if(categoryController.getCategoriesInprogress){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GridView.builder(
                  itemCount: categoryController.categoryModel.data?.length?? 0,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 16,
                    ), itemBuilder: (context, index){
                      return FittedBox(child: CategoryCard(
                        categoryData: categoryController.categoryModel.data![index],
                      )) ;
                }
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
