import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/widgets/category.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/images.dart';

class SliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 60,
        color: Colors.black,
        child: Row(
          children: [
            SizedBox(width: 10,),
            SelectCategory(
                text: "Бургеры", image: Image.asset(AppImages.burgerc)),
            SizedBox(width: 10),
            SelectCategory(
                text: "Пицца", image: Image.asset(AppImages.pizza)),
            SizedBox(width: 10),
            SelectCategory(
                text: "Фрэнч Доги", image: Image.asset(AppImages.snacdog)),
            SizedBox(width: 10),
            SelectCategory(
                text: "Снэки", image: Image.asset(AppImages.snack)),
            SizedBox(width: 10),
            SelectCategory(
                text: "Напитки", image: Image.asset(AppImages.drink)),
            SizedBox(width: 10),
            SelectCategory(
                text: "Салаты", image: Image.asset(AppImages.salad)),
            SizedBox(width: 10),
            SelectCategory(
                text: "Супы", image: Image.asset(AppImages.sub)),
            SizedBox(width: 10),
            SelectCategory(
                text: "Десерты", image: Image.asset(AppImages.desert)),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}