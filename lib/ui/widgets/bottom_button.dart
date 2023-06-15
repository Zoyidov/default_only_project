import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../utils/colors.dart';
import '../home/buttons_widget/c_button.dart';
import '../home/buttons_widget/level_button.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onNextTap,
    required this.onPreviousTap,
    required this.onNextTapVisibility,
    required this.onPreviousTapVisibility,
  }) : super(key: key);

  final VoidCallback onNextTap;
  final bool onNextTapVisibility;
  final bool onPreviousTapVisibility;
  final VoidCallback onPreviousTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.C_162023,
      padding:  EdgeInsets.symmetric(vertical: 20.h, horizontal: 32.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width / 4,
            child: Visibility(
              visible: onPreviousTapVisibility,
              child: Level(text: "Previous", onTap: (){}, height: 50, width: 100)
            ),
          ),
          SizedBox(
            width: width / 4,
            child: Visibility(
              visible: onNextTapVisibility,
              child: ButtonC(text: "Next", onTap: (){}, height: 50, width: 100),
            ),
          ),
        ],
      ),
    );
  }
}
