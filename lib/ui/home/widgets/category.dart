import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ZoomTapAnimation(
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            child: Center(child: Text(text)),
          ),
        ),
      ),
    );
  }
}
