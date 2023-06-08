import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_screen_homework/utils/colors.dart';

class GlobalElevatedButton extends StatelessWidget {
  final String text;
  final String svgIcon;
  final VoidCallback onPressed;

  const GlobalElevatedButton({
    Key? key,
    required this.text,
    required this.svgIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: height * (567 / 812), left: width * (112 / 375)),
      child: Material(
        elevation: 4, // Adjust the value to control the shadow intensity
        borderRadius: BorderRadius.circular(2),
        child: Container(
          height: 40,
          width: 151,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.top,
                AppColors.left,
              ],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  svgIcon,
                  width: width * (20 / 375),
                  height: height * (20 / 812),
                ),
                SizedBox(width: width * (8 / 375)),
                Text(
                  text,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}