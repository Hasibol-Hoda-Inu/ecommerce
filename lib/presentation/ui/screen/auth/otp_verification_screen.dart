import 'package:ecommerce/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utility/image_assets.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                const SizedBox(height: 160,),
                Center(
                  child: SvgPicture.asset(ImageAssets.CraftyBayLogoSVG, width: 120,),
                ),
                const SizedBox(height: 24,),
                Text('Enter your OTP code', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24, fontWeight: FontWeight.w700),),
                const SizedBox(height: 8,),
                Text('A 4 digit OTP code has been sent', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),),
                const SizedBox(height: 34,),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    inactiveFillColor: Colors.white,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveColor: AppColors.primaryColor,
                    activeColor: AppColors.primaryColor,
                    selectedColor: Colors.green,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                    },
                  appContext: context,
                ),
                const SizedBox(height: 8,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text('Next')
                  ),
                ),
                const SizedBox(height: 24,),
                RichText(text: const TextSpan(
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: 'This code will expire in '
                    ),
                    TextSpan(
                      text: '120s',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      )
                    )
                  ]
                )),
                TextButton(
                    onPressed: (){},
                   style: TextButton.styleFrom(foregroundColor: Colors.grey),
                    child: const Text('Resend'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
