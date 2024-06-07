import 'package:ecommerce/presentation/ui/screen/auth/otp_verification_screen.dart';
import 'package:flutter/cupertino.dart';
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

  final TextEditingController _emailTEController= TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,

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

                  TextFormField(
                    controller: _emailTEController,
                    decoration: const InputDecoration(
                    hintText: 'yourmail@gmail.com',
                  ),
                  validator: (String? text){
                      if(text?.isEmpty??true){
                        return 'Enter your email address';
                      }else if(text!.isEmail==false){
                        return 'Enter a valid email address';
                      }
                      return null;
                  },
                  ),
                  const SizedBox(height: 8,),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            Get.to(const OtpVerificationScreen());
                          }
                        },
                        child: const Text('Next')
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
