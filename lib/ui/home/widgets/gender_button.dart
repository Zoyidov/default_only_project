import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_screen_homework/utils/colors.dart';
import 'package:login_screen_homework/utils/images.dart';

class Gender extends StatefulWidget {
  final String icon;
  final String selectedIcon;
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  const Gender({
    Key? key,
    required this.icon,
    required this.selectedIcon,
    required this.text,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 48,
        width: 156,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: widget.isSelected ? AppColors.C_52B6DF : AppColors.C_CBD5E1,
          ),
          color: widget.isSelected ? AppColors.C_CBD5E1 : AppColors.C_F1F5F9,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.isSelected
                ? SvgPicture.asset(
              widget.selectedIcon,
              width: 24,
              height: 24,
            )
                : SvgPicture.asset(
              widget.icon,
              width: 24,
              height: 24,
            ),
            SizedBox(width: 8),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                color: widget.isSelected
                    ? AppColors.blackColor
                    : AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
