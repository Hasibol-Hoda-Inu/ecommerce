import 'package:ecommerce/presentation/ui/screen/auth/email_varification_screen.dart';
import 'package:ecommerce/presentation/ui/screen/auth/otp_verification_screen.dart';
import 'package:ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState(){
    super.initState();
    gotoNextScreen();
  }

  void gotoNextScreen(){
    Future.delayed(const Duration(seconds: 3)).then(
            (value) {
              Get.offAll(const HomeScreen());
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: SvgPicture.asset(ImageAssets.CraftyBayLogoSVG, width: 120,),
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(height: 20,),
          const Text('version: 1.0.0'),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}
