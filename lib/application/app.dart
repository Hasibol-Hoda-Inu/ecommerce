import 'package:ecommerce/presentation/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/ui/utility/app_color.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors().color),
        elevatedButtonTheme: ElevatedButtonThemeData(
           style: ElevatedButton.styleFrom(
             backgroundColor: AppColors.primaryColor,
               foregroundColor: Colors.white,
               padding: EdgeInsets.symmetric(vertical: 14),
               textStyle: TextStyle(
                 fontWeight: FontWeight.w600,
                 fontSize: 16,
                 letterSpacing: 0.5,
               ),
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
           )
        ),
        inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey)
      ),
          disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey)
      ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor)
          ),
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
          ),
    ),
      )
    );
  }
}
