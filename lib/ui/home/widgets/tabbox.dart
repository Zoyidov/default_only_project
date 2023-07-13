import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_screen_homework/utils/images.dart';

class TabBox extends StatelessWidget {
  const TabBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16)),color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AppImages.home,),
            SvgPicture.asset(AppImages.basket),
            Image.asset(AppImages.img,height: 40),
            SvgPicture.asset(AppImages.favourite),
            SvgPicture.asset(AppImages.smile),
          ],
        ),
      ),
    );
  }
}
