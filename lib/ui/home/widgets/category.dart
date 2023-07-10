import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Categories extends StatefulWidget {
   Categories({Key? key, required this.text,required this.isSelected}) : super(key: key);
  final String text;
  bool isSelected = false;


  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.isSelected = !widget.isSelected;
          });
        },
        child: ZoomTapAnimation(
          child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: widget.isSelected ? Colors.white : Colors.black,),
              borderRadius: BorderRadius.circular(16),
              color: widget.isSelected ? Colors.indigo : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Center(child: Text(widget.text,style: TextStyle(fontWeight: FontWeight.w500),)),
            ),
          ),
        ),
      ),
    );
  }
}
