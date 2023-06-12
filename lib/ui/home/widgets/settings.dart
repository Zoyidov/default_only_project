import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/images.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key, required this.title, required this.icon, required this.widthIcon, required this.onTap}) : super(key: key);

  final String title;
  final String icon;
  final double widthIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: width * (40/375),
                  height: height * (40/812),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.C_F1F5F9,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      icon,
                      width: width * (16/375),
                      height: height * (20/812),
                    ),
                  ),
                ),
                SizedBox(width: width * (14/375)),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(AppImages.back),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
