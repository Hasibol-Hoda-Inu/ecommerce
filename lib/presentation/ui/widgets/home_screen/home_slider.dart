import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/slider_data.dart';
import '../../utility/app_color.dart';

class HomeSlider extends StatefulWidget {
  final List<SliderData>sliders;
  const HomeSlider({super.key, required this.sliders});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 160.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: widget.sliders.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(.02),
                    ),
                    alignment: Alignment.center,
                    child: Image.network(sliderData.image ??''));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
            valueListenable: _selectedSlider,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i<widget.sliders.length; i++) {
                list.add(Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    color: value == i ? AppColors.primaryColor : null,
                  ),
                ));
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              );
            }),
      ],
    );
  }
}
