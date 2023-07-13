import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({Key? key, required this.text, required this.image})
      : super(key: key);

  final String text;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF22222A),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
          child: Row(
            children: [
              SizedBox(child: image,height: 20,width: 20,),
              const SizedBox(width: 8),
              Text(text,style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
