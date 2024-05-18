import 'package:ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/circular_icon_button.dart';

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
              onTap: () {  },
            ),
            const SizedBox(width: 8,),
            CircularIconButton(
              icon: Icons.phone,
              onTap: () {  },
            ),
            const SizedBox(width: 8,),
            CircularIconButton(
              icon: Icons.notifications,
              onTap: () {  },
            ),
          ],
        ),
      ),
    );
  }
}
