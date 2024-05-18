import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utility/image_assets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                const SizedBox(height: 60,),
                Center(
                  child: SvgPicture.asset(ImageAssets.CraftyBayLogoSVG, width: 120,),
                ),
                const SizedBox(height: 24,),
                Text('Complete your profile', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24, fontWeight: FontWeight.w700),),
                const SizedBox(height: 8,),
                Text('Get started with us with your details', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),),
                const SizedBox(height: 34,),
                TextFormField(decoration: const InputDecoration(
                  hintText: 'First Name',
                ),),
                const SizedBox(height: 12,),
                TextFormField(decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),),
                const SizedBox(height: 12,),
                TextFormField(decoration: const InputDecoration(
                  hintText: 'Mobile',
                ),),
                const SizedBox(height: 12,),
                TextFormField(decoration: const InputDecoration(
                  hintText: 'City',
                ),),
                const SizedBox(height: 12,),
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                  hintText: 'Shipping address',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10,)
                ),),
                const SizedBox(height: 18,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text('Complete')
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
