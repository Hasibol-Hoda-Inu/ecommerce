import 'package:ecommerce/presentation/state_holders/category_controller.dart';
import 'package:ecommerce/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/state_holders/product_controller.dart';
import 'package:ecommerce/presentation/ui/screen/cart_screen.dart';
import 'package:ecommerce/presentation/ui/screen/category_list_screen.dart';
import 'package:ecommerce/presentation/ui/screen/home_screen.dart';
import 'package:ecommerce/presentation/ui/screen/wishlist.dart';
import 'package:ecommerce/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  MainBottomNavController mainBottomNavController = Get.put(MainBottomNavController());

  List<Widget> _screens= [
    HomeScreen(),
    CategoryListScreen(),
    CartScreen(),
    Wishlist(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSliderController>().getHomeSlider();
      Get.find<CategoryController>().getCategories();
      Get.find<ProductController>().getPopularProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            currentIndex: mainBottomNavController.currentSelectedIndex,
            onTap: mainBottomNavController.changeScreen,
            items:  const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: "Categories"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Wishlist'),
            ],
          ),
        );
      }
    );
  }
}
