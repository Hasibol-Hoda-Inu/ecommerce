import 'package:ecommerce/presentation/state_holders/category_controller.dart';
import 'package:ecommerce/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/state_holders/product_controller.dart';
import 'package:ecommerce/presentation/ui/screen/product_list_screen.dart';
import 'package:ecommerce/presentation/ui/utility/app_color.dart';
import 'package:ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:ecommerce/presentation/ui/widgets/home_screen/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/category_icon_card_widget.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/product_card_widget.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImageAssets.CraftyBayNavLogoSVG),
            const Spacer(),
            CircularIconButton(
              icon: Icons.person,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.phone,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.notifications,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: const Icon(Icons.search_rounded),
                  prefixIconColor: AppColors.primaryColor,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  disabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<HomeSliderController>(
                builder: (homeSliderController) {
                  if(homeSliderController.getHomeSlidersInprogress){
                    return const SizedBox(
                      height: 180,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return HomeSlider(sliders: homeSliderController.sliderModel.data??[]);
                }
              ),
              const SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: "Categories",
                onTap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 110,
                child: GetBuilder<CategoryController>(
                  builder: (categoryController) {
                    if(categoryController.getCategoriesInprogress){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: categoryController.categoryModel.data?.length?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                              categoryData: categoryController.categoryModel.data![index]);
                        });
                  }
                ),
              ),
              const SizedBox(height: 16,),
              SectionTitle(title: 'Popular',
                  onTap: (){
                Get.to(const ProductListScreen());
                  }),
              SizedBox(
                height: 182,
                child: GetBuilder<ProductController>(
                  builder: (productController) {
                    if(productController.getPopularProductsInProgress){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: productController.popularProductModel.data?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return ProductCard(
                            product: productController.popularProductModel.data![index],
                          );
                    });
                  }
                ),
              ),
              const SizedBox(height: 16,),
              SectionTitle(title: 'Special',
                  onTap: (){
                Get.to(const ProductListScreen());
                  }),
               SizedBox(
                height: 182,
                // child: ListView.builder(
                //     itemCount: 20,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index){
                //       return ProductCard();
                //     }),
              ),
              const SizedBox(height: 16,),
              SectionTitle(title: 'New',
                  onTap: (){
                Get.to(const ProductListScreen());
                  }),
               SizedBox(
                height: 182,
                // child: ListView.builder(
                //     itemCount: 20,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index){
                //       return ProductCard();
                //     }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



