import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 253,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        color: AppColors.C_1317DD,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: "SfPro",
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
