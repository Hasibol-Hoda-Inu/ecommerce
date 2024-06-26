import 'package:ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:ecommerce/presentation/ui/screen/auth/email_varification_screen.dart';
import 'package:ecommerce/presentation/ui/screen/main_bottom_nav_screen.dart';
import 'package:ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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

  Future<void> gotoNextScreen() async {
    await AuthController.getAccessToken();
    Future.delayed(const Duration(seconds: 3)).then(
            (value) {
              Get.offAll(()=> AuthController.isLoggedIn?const MainBottomNavScreen(): const EmailVerificationScreen());
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
