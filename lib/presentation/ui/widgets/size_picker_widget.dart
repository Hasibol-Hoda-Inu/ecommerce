import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onSelected, required this.initialSelected});

  final List<String> sizes;
  final Function(int selectedIndex)onSelected;
  final int initialSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int _selectedSizeIndex=0;

  @override
  void initState(){
    _selectedSizeIndex=widget.initialSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.sizes.length,
      itemBuilder: (context, index){
        return InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: (){
            _selectedSizeIndex =index;
            widget.onSelected(index);
            if(mounted){
              setState(() {

              });
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              border: Border.all(color:_selectedSizeIndex==index?AppColors.primaryColor:Colors.black87),
              borderRadius: BorderRadius.circular(40),
            ),
            child: CircleAvatar(
              backgroundColor: _selectedSizeIndex==index?AppColors.primaryColor:Colors.white,
              child: Text(widget.sizes[index], style: TextStyle(
                color: _selectedSizeIndex==index?Colors.white:null,
                fontSize: 14,
              ),),
            ),
          ),
        );
      },
    );
  }
}