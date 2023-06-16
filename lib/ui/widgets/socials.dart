import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_screen_homework/utils/colors.dart';

class SocialButton extends StatelessWidget {
  final SvgPicture svgPicture;
  final VoidCallback onPressed;

  const SocialButton({super.key,
    required this.svgPicture,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.whiteColor,
      ),
      child: Stack(
        children: [
          MaterialButton(
            onPressed: onPressed,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(child: svgPicture),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
