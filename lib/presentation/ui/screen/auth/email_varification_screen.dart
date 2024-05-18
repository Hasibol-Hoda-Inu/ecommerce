import 'package:ecommerce/presentation/ui/screen/auth/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utility/image_assets.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const SizedBox(height: 160,),
              Center(
                child: SvgPicture.asset(ImageAssets.CraftyBayLogoSVG, width: 120,),
              ),
              const SizedBox(height: 16,),
              Text('Welcome back', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24, fontWeight: FontWeight.w700),),
              const SizedBox(height: 8,),
              Text('Please enter your email address', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),),
              const SizedBox(height: 16,),

              TextFormField(decoration: const InputDecoration(
                hintText: 'yourmail@gmail.com',
              ),),
              const SizedBox(height: 8,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      Get.to(const OtpVerificationScreen());
                    },
                    child: const Text('Next')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
